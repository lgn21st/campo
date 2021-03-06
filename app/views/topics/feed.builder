xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Swiftist.org"
    xml.link root_url
    xml.description "Swift最优质，最专业开发者社区"
    for topic in @topics
      xml.item do
        xml.title topic.title
        xml.description markdown_format(topic.body)
        xml.pubDate topic.created_at.strftime("%a, %d %b %Y %H:%M:%S %z")
        xml.author topic.user.name
        xml.link topic_url topic
        xml.guid topic_url topic
      end
    end
  end
end
