class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_params)
    comment.book_id = book.id
    comment.save
    render :index
  end

  def destroy
    book = BookComment.find(params[:id])
    book.destroy
    render :index
  end

  private
    def book_params
      params.require(:book_comment).permit(:comment)
    end
end
