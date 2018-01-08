class WelcomeController < ApplicationController
  # skip_before_action :require_login, only: [:index,:uploads]
  def index
    
    @articles=Article.all
    # @comment=Comment.new(article_id:2)
    flash.clear
    # binding.pry
    # render inline: "<% @articles.each do |p| %><p><%= p.text %></p><% end %>"
    # @json="123"
    # render json: @json
    
  end
   
def upload
  uploaded_io = params[:articles][:text]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end
end

end
class LabellingFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options={})
  label(attribute) 
  end
end