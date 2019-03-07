require 'csv'

class PagesController < ApplicationController
  def home
    # @guests = load_csv
    # email = params[:email]
    # unless @guests.include?(email)
    #   @notification = "Vous n'êtes pas autorisé à entrer sur ce site"
    #   render :landing
    # end
    @user = current_user
    @answer = Answer.new
  end

  def infos
  end

  private

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
