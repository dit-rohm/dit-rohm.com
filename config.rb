###
# Blog settings
###

Time.zone = "Tokyo"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.name = "news"
  blog.prefix = "news"

  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.new_article_template = "source/templates/news.erb"
  blog.tag_template = "news/tag.html"
  blog.calendar_template = "news/calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
   blog.page_link = "page/{num}"
end

activate :blog do |blog|
  blog.name = "blog"
  blog.prefix = "blog"

  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "blog"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 120
  # blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.new_article_template = "source/templates/blog.erb"
  blog.tag_template = "blog/tag.html"
  blog.calendar_template = "blog/calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/{num}"
end

page "/blog/feed.xml", layout: false

ignore 'templates/*'

# Append bower path
after_configuration do
  bowerrc = JSON.parse File.read(File.join "#{root}", '.bowerrc')
  bower_dir = bowerrc['directory']
  sprockets.append_path File.join("#{root}", bower_dir)

  Dir.glob File.join "#{root}", bower_dir, '**/*', '{bower,component,.bower}.json' do |f|
    bower = JSON.parse File.read(f), create_additions: false
    dirname = File.dirname f
    case bower['main']
    when String
      sprockets.append_path File.dirname(File.join(dirname, bower['main']))
    when Array
      bower['main'].each do |name|
        sprockets.append_path File.dirname(File.join(dirname, name))
      end
    end
  end
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :syntax

activate :deploy do |deploy|
  deploy.method   = :ftp
  deploy.host     = 'kir590923.kir.jp'
  deploy.path     = '/public_html'
  deploy.user     = 'kir590923'
  deploy.password = 'd78gff8a'
end

configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = ''
  end
end

configure :build do
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-61361620-1'
  end

  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :imageoptim

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
