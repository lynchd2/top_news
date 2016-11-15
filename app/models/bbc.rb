class Bbc
	def initialize
		@base_url = "http://www.bbc.com"
	end

	def get_news
		base_link = "http://www.bbc.com/news"
		links = []
		headline_with_links = {}
		page = HTTParty.get(@base_url + "/news/popular/read")
		parse_page = Nokogiri::HTML(page)
		parse_page.css("li").css(".most-popular-page-list-item").css("a").each do |headline|
			headline.each_with_index do |attribute, i|
				headline_with_links[headline.text.gsub(/\s+\d+/, "").gsub("\n", "")] = base_link + attribute[1] if i % 2 == 0
			end
		end
		headline_with_links
	end

end