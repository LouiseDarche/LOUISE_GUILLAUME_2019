require 'csv'

class PagesController < ApplicationController
  def home
    @guests = load_csv
    email = params[:email]
    unless @guests.include?(email)
      @notification = "Vous n'êtes pas autorisé à entrer sur ce site"
      render :landing
    end
    @user = current_user
    @answer = Answer.new
  end

  def answer
    @answer = Answer.new(answer_params)
    if @answer.save
      save_to_csv
      redirect_to root_path
    else
      @notification = "🙌 Votre réponse a bien été prise en compte! 🙌"
      render :new
    end
  end

  def infos
  end

  private
  def answer_params
    params.require(:answer).permit(:name, :email, :answer_dinner, :nb_dinner, :answer_brunch, :nb_brunch)
  end

  def save_to_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath    = File.join(__dir__, '../../db/answers.csv')

    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['Name', 'Email', 'answer_dinner', 'nb_dinner', 'answer_brunch', 'nb_brunch']
      Answer.all.each do |answer|
        csv << answer
      end
      # ...
    end


  end
  def load_csv
    filepath = File.join(__dir__, '../../db/emails.csv')
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    emails = []
    CSV.foreach(filepath, csv_options) do |row|
      emails << row[0]
    end
    emails
  end
end
