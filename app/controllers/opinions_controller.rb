class OpinionsController < ApplicationController
http_basic_authenticate_with name: "admin", password: "secret", only: [:destroy]
  def index
    redirect_to film_path(params[:film_id])
  end

  def create
    @film = Film.find(params[:film_id])
    @opinion = @film.opinions.build(opinion_params)

    if @opinion.save
      redirect_to film_path(@film)
    else
      render "films/show"
    end
  end

  def destroy
    opinion = Opinion.find(params[:id])
    opinion.destroy

    redirect_to film_path(params[:film_id])
  end

private

  def opinion_params
    params.require(:opinion).permit(:author, :rating, :comment)
  end
end
