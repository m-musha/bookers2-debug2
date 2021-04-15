class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # ログインしているユーザーのみにアクセスを許可する
  
  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer #遷移先のURLを取得してリダイレクト
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end
end
