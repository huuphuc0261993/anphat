# frozen_string_literal: true

module InitServices
  class InitProduct

    def initialize(banner, banners_ids)
      @banner = banner
      @banners_ids = banners_ids
    end

    def perform
      
      return if @banners_ids.blank?    
      current_pictures = @banner.banners.pluck(:id)
   
      Picture.where(id: current_pictures - @banners_ids).destroy_all
      banners = Picture.where(id: @banners_ids - current_pictures)

      return if banners.blank?

      banners.each do |picture|
        picture.banner = @banner
        picture.save
      end
    end
  end
end
