class Npr
	def initialize
		@base_url = "http://www.npr.org"
	end

	def get_news
		links = []
		headline_with_links = {}
		page = HTTParty.get(@base_url)
		parse_page = Nokogiri::HTML(page)
		parse_page.css(".nib-container").css(".item-nib").css("a").each do |headline|
			headline.attributes.each do |attribute|
				headline_with_links[headline.css("h2").text] = attribute[1].value if attribute[1].value[0..3] == "http"
			end
		end
		headline_with_links
	end

end