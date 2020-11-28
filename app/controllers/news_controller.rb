class NewsController < ApplicationController
    def index
    @news = News.all
    render json: @news
    end

    def create
    @news = News.new(news_params)
    if @news.save
        render json: { status: :ok, message: 'Success' }
    else
        render json: { json: @news.errors, status: :unprocessable_entity }
    end
    end

    def show
    @news = News.find(params[:id])
    render json: { data: @news, status: :ok, message: 'Success' }
    end

    def update
    @news = News.find(params[:id])
    if @news.update(news_params)
        render json: { status: :ok, message: 'Success' }
    else
        render json: { json: @news.error, status: :unprocessable_entity }
    end
    end

    def destroy
    @news = News.find(params[:id])
    if @news.destroy
        render json: { json: 'News was successfully deleted.'}
    else
        render json: { json: @news.errors, status: :unprocessable_entity }
    end
    end

    private

    def news_params
    params.require(:news).permit(:id, :first_name, :last_name, :email, :phone,:address)
    end
end
