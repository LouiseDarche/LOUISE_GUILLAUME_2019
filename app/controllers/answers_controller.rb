class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    attributes = {
      name: params[:answer][:name],
      email: params[:answer][:email],
      answer_dinner: params[:answer][:answer_dinner],
      nb_dinner: params[:answer][:nb_dinner],
      answer_brunch: params[:answer][:answer_brunch],
      nb_brunch: params[:answer][:nb_brunch]
    }
    @answer = Answer.new(attributes)
    if @answer.save
      redirect_to root_path
    else
      render :new
    end
  end
end
