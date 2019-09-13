class FullSimulationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @simulations = current_user.full_simulations
  end

  def show
    @full_simulation = FullSimulation.find(params[:id])
  end

  def new
    @full_simulation = FullSimulation.new
  end

  def create
    @full_simulation = FullSimulation.new(user: current_user)
    if @full_simulation.save
      flash[:success] = "Vous venez de commencer une simulation"
      redirect_to user_full_simulation_path(current_user, @full_simulation)
    else
      flash[:error] = @full_simulation.errors.messages
      render 'new'
    end
  end

  def edit
    @full_simulation = FullSimulation.find(params[:id])
  end

  def update
    @full_simulation = FullSimulation.find(params[:id])
    if @full_simulation.update(full_simulation_params)
      flash[:success] = "Votre simulation a été validée"
      redirect_to user_full_simulation_path(current_user, @full_simulation)
    else
      flash[:error] = "Votre simulation n'a été validée"
      render :edit
    end
  end

  def destroy
    @full_simulation = FullSimulation.find(params[:id])

    if @full_simulation.destroy
      flash[:success] = "La simulation a bien été supprimée"
      redirect_to user_full_simulations_path(current_user)
    else
      flash[:error] = "La simulation n'a pa pu être supprimée"
      redirect_to user_full_simulations_path(current_user)
    end
  end

  private
  def full_simulation_params
    params.require(:full_simulation).permit(:total_cost_saved, :validated)
  end
end
