require 'minitest/autorun'
require 'jekyll'
require 'tmpdir'
require 'fileutils'
require 'nokogiri'

# Catches broken dialog integration or PDF/preview links after baseurl deployment.
class CvPreviewTest < Minitest::Test
  def test_navigation_opens_an_accessible_preview_with_downloadable_assets
    root = File.expand_path('..', __dir__)
    temporary = File.realpath(Dir.mktmpdir('cv-render'))
    %w[_layouts _includes _data].each do |folder|
      FileUtils.cp_r(File.join(root, folder), temporary)
    end
    assets = File.join(root, 'assets/cv')
    if File.directory?(assets)
      FileUtils.mkdir_p(File.join(temporary, 'assets'))
      FileUtils.cp_r(assets, File.join(temporary, 'assets/cv'))
    end
    File.write(File.join(temporary, 'index.html'), "---\nlayout: default\n---\nHome fixture.\n")
    FileUtils.cp(File.join(root, '_pages/cv.md'), File.join(temporary, 'cv.md'))
    Dir.chdir(temporary) do
      config = Jekyll.configuration('config' => File.join(root, '_config.yml'),
        'source' => temporary, 'destination' => File.join(temporary, '_site'),
        'url' => 'https://example.test', 'baseurl' => '/preview',
        'plugins' => [], 'quiet' => true)
      Jekyll::Site.new(config).process
    end
    document = Nokogiri::HTML(File.read(File.join(temporary, '_site/index.html')))
    trigger = document.at_css('#site-nav a[data-cv-open]')
    refute_nil trigger, 'CV navigation should open the document preview'
    dialog = document.at_css('dialog')
    refute_nil dialog, 'The popup must be present on every page'
    label = document.at_css("##{dialog['aria-labelledby']}")
    assert_includes label.text, 'Curriculum vitae'
    download = dialog.at_css('a[download]')
    refute_nil download, 'Readers must be able to download the PDF'
    assert_equal '/preview/assets/cv/Sunghwan-Yoo-CV.pdf', download['href']
    pdf_path = File.join(temporary, '_site', download['href'].delete_prefix('/preview'))
    assert File.file?(pdf_path), 'The download target must be a generated static asset'
    assert_equal '%PDF-', File.binread(pdf_path, 5)
    images = dialog.css('img')
    assert_equal 1, images.length
    images.each do |image|
      assert image['alt'].to_s.length.positive?
      assert File.file?(File.join(temporary, '_site', image['src'].delete_prefix('/preview'))), 'Preview pages must exist'
    end
    fallback = Nokogiri::HTML(File.read(File.join(temporary, '_site/cv/index.html')))
    assert fallback.at_css('#main a[download]'), 'The CV route must still work without JavaScript'
  ensure
    FileUtils.remove_entry(temporary) if temporary && File.directory?(temporary)
  end
end
