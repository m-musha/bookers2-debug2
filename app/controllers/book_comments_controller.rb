class BookCommentsController < ApplicationController
  
	def create
		@book = Book.find(params[:book_id])
		@comment = BookComment.new(book_comment_params)
		@comment.book_id = @book.id
		@comment.user_id = current_user.id
		if @comment.save
  		redirect_to book_path(@book.id)
		else
		  render 'books/show'
		end
	end

  def destroy
  	@book = Book.find(params[:id])
  	co
  end
  
  private
  
  def list_params
    params.require(:book_comment).permit(:comment)
  end
  
end
