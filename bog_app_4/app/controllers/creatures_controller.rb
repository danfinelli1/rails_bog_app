class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end
  def show
    @creature = Creature.find_by_id(creature_id)
  end
  def new
    @creature = Creature.new
  end
  def create
    creature = Creature.new(creature_params)
    if creature.save
      redirect_to creatures_path
    end
  end
  def edit
    @creature = Creature.find_by_id(creature_id)
  end
  def update
    creature = Creature.find_by_id(creature_id)
    creature.update_attributes(creature_params)
  end
  def destroy
    creature = Creature.find_by_id(creature_id)
    creature.destroy
    redirect_to creatures_path
  end
private
  def creature_params
    params.require(:creature).permit(:name, :description)
  end
  def creature_id
    params[:id]
  end
end
