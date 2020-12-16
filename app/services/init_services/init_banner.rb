# frozen_string_literal: true

module InitServices
  class InitProduct
    def initialize(banner, banners_ids)
      @banner = banner
      @banners_ids = banners_ids
    end

    def perform
      return if @banners_ids.blank?

      current_banners = @banner.banners.pluck(:id)
      Banner.where(id: current_banners - @banners_ids).destroy_all
      banners = Banner.where(id: @banners_ids - current_banners)
      return if banners.blank?

      banners.each do |banner|
        banner.banner = @banner
        banner.save
      end
    end
  end
end
