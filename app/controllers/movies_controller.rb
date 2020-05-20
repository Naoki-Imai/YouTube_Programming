class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @review = @movie.reviews.build
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to movie_path(@movie), notice: "投稿しました"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    if @movie.user != current_user
      redirect_to movie_path(@movie), alert: "不正なアクセスです"
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to user_path(movie.user), notice: "削除しました"
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :url, :comment)
  end
end
