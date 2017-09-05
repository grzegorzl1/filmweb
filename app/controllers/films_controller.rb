class FilmsController < ApplicationController
http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]
  def index
    @films = Film.all.order(created_at: :desc)
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.create(film_params)

    if @film.new_record?
      render "new"
    else
      redirect_to films_path
    end
  end

  def show
    @film = Film.find(params[:id])
    @opinion = Opinion.new
    @next_film = @film.next_film
    @previous_film = @film.previous_film
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])

    if @film.update(film_params)
      redirect_to film_path
    else
      render "edit"
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy

    redirect_to films_path
  end

  private

  def film_params
    params.require(:film).permit(:title, :premiere_date, :duration, :description,
    :genre, :director, :scenarist, :country)
  end
end
