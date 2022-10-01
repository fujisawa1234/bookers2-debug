class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_params)
    comment.book_id = book.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    book = BookComment.find(params[:id])
    book.destroy
    redirect_to book_path(params[:book_id])
  end

  private
    def book_params
      params.require(:book_comment).permit(:comment)
    end
end