class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie_id = @movie.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to movie_path(@movie), notice: "レビューを投稿しました"
    else
      render :new, alert: "レビューを入れてください"
    end
  end
  def update
    
  end
  def edit

  end
  def destroy
    
  end
end

private
def review_params
  params.require(:review).permit(:body)

end
