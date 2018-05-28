class Site::Profile::AdsController < Site::ProfileController
  before_action :set_ad, only:[:edit, :update]
  
  def index
    @ads = Ad.self_ads(current_member)
  end
  
  def edit
   
  end
  
  def update
    if @ad.update(params_ad)
      redirect_to site_profile_ads_path, notice: 'Anúncio atualizado com sucesso'
    else
      render :edit
    end
  end
  
  def new
    @ad = Ad.new
  end
  
  def create
    @ad = Ad.new(params_ad)
    @ad.member = current_member
    
    if @ad.save
      redirect_to site_profile_ads_path, notice: 'Anúncio criado com sucesso'
    else
      render :new
    end
  end
  
  private
  
  def set_ad
     @ad = Ad.find params[:id]
  end
  
  def params_ad
   params.require(:ad).permit(:title, :category_id, :price, :description,
                              :picture, :finish_date)
  end
end
