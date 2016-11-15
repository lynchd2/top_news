class Guardian

	def initialize
		@base_url = "https://www.theguardian.com/"
	end

	def get_news
		headline_to_link = {}
		links = []
		headlines = []
		page = HTTParty.get(@base_url + "us")
		parse_page = Nokogiri::HTML(page)
		parse_page.css("#headlines").search(".fc-item__link").each do |headline|
			headlines << headline.text.gsub("\n\n", ": ").chomp
			headline.attributes.each do |k, v|
				if v.value.length > 80 && !links.include?(v.value)
					links << v.value
				end
			end
		end
		headlines.each_with_index do |headline, i|
			headline_to_link[headline] = links[i]
		end
		headline_to_link
	end

end