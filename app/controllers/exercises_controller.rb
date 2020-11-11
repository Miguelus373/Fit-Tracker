class ExercisesController < ApplicationController
  before_action :require_login

  # GET /exercises
  # GET /exercises.json
  def index
    if params[:external]
      @exercises = current_user.exercises.not_grouped.includes(:groups)
    else
      current_user.exercises.includes(:groups)
    end
  end

  # GET /exercises/new
  def new
    @exercise = current_user.exercises.new
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      unless params[:exercise][:group] == ''
        Group.find(params[:exercise][:group]).exercises << @exercise
        return redirect_to group_path(params[:exercise][:group]),
                           notice: 'Exercise successfully added.'
      end
      redirect_to exercises_path(external: true), notice: 'Exercise successfully created.'
    else
      flash.now[:alert] = @exercise.errors.full_messages.first
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def exercise_params
    params.require(:exercise).permit(:Name, :Amount, :time, :distance)
  end
end
