class SearchService
    def initialize(params)
        @params = params
        @products = Product.all
    end

    def call
        return @products if @params.nil?

        search_by_category
        filter_by_title
        filter_by_buy_status_available
        filter_by_buy_rent_available
        filter_by_price_range
        
        @products
    end

    def search_by_category
        return unless @params[:category_id].present?

        @products = Product.joins(:product_caegory).where(product_category: { category_id: @params[category_id] })
    end

    def filter_by_title
        return unless @params[:title].present?

        @products = Product.where('title ILIKE ?', @params[:title])
    end

    def filter_by_buy_status_available
        return unless @params[:buy].present?

        @products = Product.where.not(status: 'bought')
    end

    def filter_by_buy_rent_available
        return unless @params[:rent].present?

        @products = Product.joins(:rents).where.not(rents: { status: 'rented' })
    end

    def filter_by_price_range
        return unless @params[:min_price_range].present? and @params[:min_price_range].present?

        @products = Product.where(price: @params[:min_price_range]...@params[:max_price_range])
    end
end
