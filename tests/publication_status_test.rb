require 'minitest/autorun'
require 'jekyll'
require 'tmpdir'
require 'fileutils'

# Exercise the real Jekyll layouts. A missing status branch must not turn a
# submitted manuscript into a published paper, even when it has a date.
class PublicationStatusTest < Minitest::Test
  def setup
    @temporary = File.realpath(Dir.mktmpdir('publication-status'))
    root = File.expand_path('..', __dir__)
    %w[_layouts _includes _sass _data assets].each do |folder|
      FileUtils.cp_r(File.join(root, folder), @temporary)
    end
    FileUtils.mkdir_p(File.join(@temporary, '_publications'))
    File.write(File.join(@temporary, '_publications/submitted.md'), <<~DOCUMENT)
      ---
      layout: single
      title: Submitted manuscript fixture
      status: submitted
      venue: Example Journal
      date: 2026-09-01
      ---
      Research manuscript.
    DOCUMENT
    File.write(File.join(@temporary, '_publications/published.md'), <<~DOCUMENT)
      ---
      layout: single
      title: Published paper fixture
      english_title: English paper title fixture
      status: published
      venue: Example Conference
      date: 2025-07-02
      ---
      Conference paper.
    DOCUMENT
    File.write(File.join(@temporary, '_publications/in-review.md'), <<~DOCUMENT)
      ---
      layout: single
      title: Review manuscript fixture
      status: submitted
      review_status: under-review
      venue: Actual Journal Full Name
      venue_display: IEEE Trans.
      date: 2026-09-01
      ---
      Review in progress.
    DOCUMENT
    File.write(File.join(@temporary, '_publications/in-preparation.md'), <<~DOCUMENT)
      ---
      layout: single
      title: Preparation manuscript fixture
      status: in-preparation
      venue: Future Journal
      date: 2026-09-01
      ---
      Manuscript in preparation.
    DOCUMENT
    File.write(File.join(@temporary, 'index.html'), <<~DOCUMENT)
      ---
      layout: archive
      title: Publication fixture
      ---
      {% for post in site.publications %}{% include archive-single.html %}{% endfor %}
    DOCUMENT
    Dir.chdir(@temporary) do
    configuration = Jekyll.configuration(
      'source' => @temporary,
      'destination' => File.join(@temporary, '_site'),
      'url' => 'https://example.test',
      'title' => 'Fixture',
      'locale' => 'en-US',
      'collections' => {'publications' => {'output' => true}},
      'compress_html' => {'ignore' => {'envs' => [Jekyll.env]}},
      'plugins' => [],
      'quiet' => true
    )
    Jekyll::Site.new(configuration).process
    end
  end

  def teardown
    FileUtils.remove_entry(@temporary)
  end

  def test_submitted_detail_never_claims_publication
    html = File.read(File.join(@temporary, '_site/publications/submitted.html'))
    assert_includes html, 'Submitted to'
    assert_includes html, 'Example Journal'
    refute_includes html, 'Published in'
    refute_includes html, 'itemprop="datePublished"'
    refute_includes html, 'property="article:published_time"'
  end

  def test_archive_distinguishes_submitted_and_published_work
    html = File.read(File.join(@temporary, '_site/index.html'))
    assert_includes html, 'Submitted to'
    assert_includes html, 'Published in <i>Example Conference</i>, 2025'
    refute_includes html, 'Published in <i>Example Journal</i>'
  end

  def test_review_status_uses_short_venue_without_claiming_publication
    html = File.read(File.join(@temporary, '_site/publications/in-review.html'))
    assert_includes html, 'Under review'
    assert_includes html, '<i>IEEE Trans.</i>'
    refute_includes html, 'Published in'
    refute_includes html, 'itemprop="datePublished"'
    refute_includes html, 'property="article:published_time"'
  end

  def test_preparation_never_claims_submission_or_publication
    archive = File.read(File.join(@temporary, '_site/index.html'))
    detail = File.read(File.join(@temporary, '_site/publications/in-preparation.html'))
    assert_includes archive, '<span class="status-label">In preparation</span>'
    assert_includes archive, '<i>Future Journal</i>'
    refute_includes archive, 'Published in <i>Future Journal</i>'
    assert_includes detail, '<span class="status-label">In preparation</span>'
    assert_includes detail, '<i>Future Journal</i>'
    refute_includes detail, 'Published in'
    refute_includes detail, 'Submitted to'
    refute_includes detail, 'Under review'
    refute_includes detail, 'itemprop="datePublished"'
    refute_includes detail, 'property="article:published_time"'
  end

  def test_english_title_sits_below_the_paper_title
    archive = File.read(File.join(@temporary, '_site/index.html'))
    detail = File.read(File.join(@temporary, '_site/publications/published.html'))
    [archive, detail].each do |html|
      assert_includes html, 'class="publication__translation"'
      assert_includes html, 'English paper title fixture'
      assert_operator html.index('English paper title fixture'), :<, html.index('Published in <i>Example Conference</i>')
      refute_includes html, 'Descriptive English translation'
    end
  end
end
