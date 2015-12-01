class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    id = params[:id]
    movie = Movie.find(id)
    movie.update_attributes(movie_params)
    redirect_to movie_path(params[:id])
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  def upvote
    id = params[:id]
    @movie = Movie.find(id)
    @movie.rank += 1
    @movie.save
    render "show"
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description, :rank)
  end
end
