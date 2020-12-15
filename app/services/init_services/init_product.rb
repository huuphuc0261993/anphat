# frozen_string_literal: true

module InitServices
  class InitProduct

    def initialize(product, pictures_ids)
      @product = product
      @pictures_ids = pictures_ids
    end

    def perform
      
      return if @pictures_ids.blank?    
      current_pictures = @product.pictures.pluck(:id)
   
      Picture.where(id: current_pictures - @pictures_ids).destroy_all
      pictures = Picture.where(id: @pictures_ids - current_pictures)

      return if pictures.blank?

      pictures.each do |picture|
        picture.product = @product
        picture.save
      end
    end
  end
end
