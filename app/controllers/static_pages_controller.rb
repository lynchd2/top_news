class StaticPagesController < ApplicationController
  def index
  	@cnn = CNN.new.get_news
  	@guardian = Guardian.new.get_news
  	@npr = Npr.new.get_news
  	@bbc = Bbc.new.get_news
  end
end
