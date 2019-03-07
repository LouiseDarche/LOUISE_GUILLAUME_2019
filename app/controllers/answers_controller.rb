class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      @notification = "🙌 Votre réponse a bien été prise en compte! 🙌"
      redirect_to root_path
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
    filepath    = File.join(__dir__, 'answers.csv')

    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['Name', 'Email', 'answer_dinner', 'nb_dinner', 'answer_brunch', 'nb_brunch']
      Answer.all.each do |answer|
        csv << [answer.name, answer.email, answer.answer_dinner, answer.nb_dinner, answer.answer_brunch, answer.nb_brunch]
      end
    end
  end

end
