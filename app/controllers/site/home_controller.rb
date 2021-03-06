class Site::HomeController < SiteController

  def index
    @categories = Category.order_by_description
    @ads = Ad.desc_order(params[:page])
    @carousel = Ad.random_ads(3)
  end
end
