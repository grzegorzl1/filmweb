class ActorsController < ApplicationController
http_basic_authenticate_with name: "admin", password: "secret", expect: [:index, :show]

  def index
    @actors = Actor.all.order(id: :desc)
  end

  def new
    @actor = Actor.new
  end

  def create
   @actor = Actor.create(actor_params)

   if @actor.new_record?
    render "new"
   else
    redirect_to actors_path
   end
  end

  def show
    @actor = Actor.find(params[:id])
    @next_actor = @actor.next_actor
    @previous_actor = @actor.previous_actor
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])

    if @actor.update(actor_params)
      redirect_to actor_path
    else
      render "edit"
    end
  end

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy

    redirect_to actors_path
  end

  private

  def actor_params
    params.require(:actor).permit(:name_surname, :date_of_birth, :country_of_origin,
    :biography, :filmography)
  end
end
