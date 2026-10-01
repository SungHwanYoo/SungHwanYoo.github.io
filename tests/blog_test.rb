require 'minitest/autorun'
require 'jekyll'
require 'tmpdir'
require 'fileutils'

# Render actual templates with temporary posts; fixtures never enter the site.
class BlogTest < Minitest::Test
  def render_blog(with_posts: true)
    root = File.expand_path('..', __dir__)
    temporary = File.realpath(Dir.mktmpdir('blog-render'))
    %w[_layouts _includes _data].each do |folder|
      FileUtils.cp_r(File.join(root, folder), temporary)
    end
    page = File.join(root, '_pages/blog.html')
    FileUtils.cp(page, File.join(temporary, 'blog.html')) if File.file?(page)
    FileUtils.mkdir_p(File.join(temporary, '_drafts'))
    File.write(File.join(temporary, '_drafts/private.md'), "---\ntitle: Private draft fixture\ncategory: paper-review\n---\nNot published.\n")
    if with_posts
      FileUtils.mkdir_p(File.join(temporary, '_posts'))
      [['2026-09-02-new-review', 'New review fixture', 'paper-review'],
       ['2026-08-01-old-review', 'Old review fixture', 'paper-review'],
       ['2026-09-01-study-note', 'Study note fixture', 'study-note']].each do |slug, title, category|
        File.write(File.join(temporary, '_posts', "#{slug}.md"), "---\ntitle: #{title}\ncategory: #{category}\nexcerpt: A short summary.\n---\nPost body.\n")
      end
    end
    Dir.chdir(temporary) do
      config = Jekyll.configuration('config' => File.join(root, '_config.yml'),
        'source' => temporary, 'destination' => File.join(temporary, '_site'),
        'url' => 'https://example.test', 'baseurl' => '/preview',
        'plugins' => [], 'quiet' => true)
      Jekyll::Site.new(config).process
    end
    path = File.join(temporary, '_site/blog/index.html')
    assert File.file?(path), 'The Blog navigation must lead to a generated page'
    yield File.read(path), temporary
  ensure
    FileUtils.remove_entry(temporary) if temporary && File.directory?(temporary)
  end

  def test_posts_are_grouped_and_link_to_readable_pages
    render_blog do |html, temporary|
      reviews = html[/<section[^>]*id="paper-reviews".*?<\/section>/m]
      notes = html[/<section[^>]*id="study-notes".*?<\/section>/m]
      refute_nil reviews
      refute_nil notes
      assert_operator reviews.index('New review fixture'), :<, reviews.index('Old review fixture')
      refute_includes reviews, 'Study note fixture'
      assert_includes notes, 'Study note fixture'
      refute_includes html, 'Private draft fixture'
      assert_includes html, 'href="/preview/blog/2026/09/02/new-review/"'
      detail = File.read(File.join(temporary, '_site/blog/2026/09/02/new-review/index.html'))
      assert_includes detail, 'Post body.'
      assert_includes detail, 'href="/preview/blog/#paper-reviews"'
      refute_includes detail, '/categories/'
      note_detail = File.read(File.join(temporary, '_site/blog/2026/09/01/study-note/index.html'))
      assert_includes note_detail, 'href="/preview/blog/#study-notes"'
      masthead = html[/<div class="masthead">.*?<\/nav>/m]
      refute_includes masthead, '>Sunghwan Yoo<'
      assert_match(/href="[^"]*\/preview\/blog\/">Blog<\/a>/, masthead)
    end
  end

  def test_empty_blog_has_clear_category_sections
    render_blog(with_posts: false) do |html, _|
      assert_includes html, 'Paper reviews'
      assert_includes html, 'Study notes'
      assert_includes html, 'No paper reviews yet.'
      assert_includes html, 'No study notes yet.'
      refute_includes html, 'Private draft fixture'
    end
  end
end
