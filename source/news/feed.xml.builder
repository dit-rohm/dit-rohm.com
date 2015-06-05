xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://dit-rohm.com/news/"
  xml.title "DIT"
  xml.subtitle "勉強会の日程やイベント等の告知"
  xml.id URI.join(site_url, blog("news").options.prefix.to_s)
  xml.link "href" => URI.join(site_url, blog("news").options.prefix.to_s)
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated(blog("news").articles.first.date.to_time.iso8601) unless blog("news").articles.empty?
  xml.author { xml.name "DIT" }

  blog("news").articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      xml.author { xml.name "DIT" }
      # xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
