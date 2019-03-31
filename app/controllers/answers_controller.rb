require 'csv'

class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  ADMINS = ["louise.darche@gmail.com", "louiseguillaume2019@gmail.com", "gchapuis@adventinternational.fr", "guillaumechapuis@live.fr"]


  def index
    if ADMINS.include?(current_user.email)
      @answers = Answer.all
      @positive_dinner_answers = Answer.where(answer_dinner: true)
      @sum_dinner = 0
      @positive_dinner_answers.each do |answer|
        @sum_dinner += answer.nb_dinner
      end
      @positive_brunch_answers = Answer.where(answer_brunch: true)
      @sum_brunch = 0
      @positive_brunch_answers.each do |answer|
        @sum_brunch += answer.nb_brunch
      end
      @visitors = load_from_csv
    else
      render :home
    end
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      save_to_csv
      @notification = "🙌 Votre réponse a bien été prise en compte! 🙌"
      redirect_to infos_pratiques_path
    else
      @notification = "Nous n'avons pas compris votre réponse"
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:name, :email, :answer_dinner, :nb_dinner, :answer_brunch, :nb_brunch)
  end

  def save_to_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath    = File.path('db/answers.csv')

    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['Name', 'Email', 'answer_dinner', 'nb_dinner', 'answer_brunch', 'nb_brunch']
      Answer.all.each do |answer|
        csv << [answer.name, answer.email, answer.answer_dinner, answer.nb_dinner, answer.answer_brunch, answer.nb_brunch]
      end
    end
  end

  def load_from_csv
    filepath = File.join(__dir__, '../../db/visitors.csv')
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    VISITORS = []
    CSV.foreach(filepath, csv_options) do |row|
      VISITORS << row[0]
    end
    VISITORS
  end

end
