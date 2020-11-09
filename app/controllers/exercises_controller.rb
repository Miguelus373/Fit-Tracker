class ExercisesController < ApplicationController
  before_action :require_login

  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = current_user.exercises
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
      redirect_to exercises_path, notice: 'Exercise was successfully created.'
    else
      flash.now[:alert] = 'Somethig went wrong, please check your data and try again'
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:AuthorId, :Name, :Amount)
    end
end
