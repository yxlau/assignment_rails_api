class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @movie = Movie.new

    respond_to do |format|
      format.json { render json: @movies}
      format.html
    end
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      respond_to do |format|
        format.html
        format.json { render json: @movie, status: :created}
      end
    else
      respond_to do |format|
        format.html
        format.json { render nothing: true, status: 400}
      end
    end
  end
  private

  def movie_params
    params.require(:movie).permit(:title)
  end
end