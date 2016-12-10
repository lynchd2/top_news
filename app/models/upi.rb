class Upi
	def initialize
		@base_url = "http://www.upi.com/Top_News"
	end

	def get_news
		links = []
		headline_with_links = {}
		page = HTTParty.get(@base_url)
		parse_page = Nokogiri::HTML(page)
		parse_page.css(".upi_item").css("a").each do |item|
			item.attributes.each do |attribute|
				links << attribute[1].value
			end
		end
		links.each_with_index do |link, i|
			if i % 2 == 0 && i < 20
				headline_with_links[links[i + 1]] = link
			end
		end
		headline_with_links
	end

end