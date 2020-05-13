class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    @movie.save
    redirect_to movie_path(@movie)
  end

  def edit
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :url, :comment)
  end
end
