class WelcomeController < ApplicationController
  def index
    @articles=Article.all
    # render inline: "<% @articles.each do |p| %><p><%= p.text %></p><% end %>"
    # @json="123"
    # render json: @json
   
  end
   

end
