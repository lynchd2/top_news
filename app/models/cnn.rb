class CNN
	attr_reader :base_url
	def initialize
		@base_url = "http://www.cnn.com"
	end

	def get_news
		links = []
		page = HTTParty.get(@base_url)
		parse_page = Nokogiri::HTML(page)
		parse_page.css("section")
		# .each do |headline|
		# 	headline.attributes.each do |k,v|
		# 		links << "http://www.cnn.com" + v.value
		# 	end
		# end
		# links
	end
end