module DefaultPageContent
    extend ActiveSupport::Concern

  included do |variable|
    before_action :set_title
  end

  def set_title
    @page_title = "Sam Portfolio | My Portfolio Website"
    @seo_keywords = "Sam Paul Portfolio"
  end
end