require 'csv'

class PagesController < ApplicationController

  EMAILS = []

  def landing
    @user = current_user
    # @user.save
    # save_email_to_csv(@user)
  end


  def home
    if params[:email].blank?
      render :landing
    else
      email = params[:email]
      EMAILS << email
      save_email_to_csv(email)
      # @guests = load_csv
      # email = params[:email]
      # if email.blank?
      #   @notification = "Vous devez préciser votre mail"
      #   render :landing
      # else
      #   @notification = "Bienvenue sur notre site !"
      # end
      @user = current_user
      @answer = Answer.new
      if @answer.save
        @notification = "🙌 Votre réponse a bien été prise en compte! 🙌"
      end
    end

  end

  def infos
    @places = Place.where.not(latitude: nil, longitude: nil)
    @markers = @places.map do |place|
      {
        lng: place.longitude,
        lat: place.latitude,
        infoWindow: render_to_string(partial: "/pages/map_box", locals: { place: place }),
        image_url: helpers.asset_url('Lemon7.png')
      }
    end
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

  def save_email_to_csv(email)
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath    = File.path('db/visitors.csv')

    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['Email']
      EMAILS.each do |email|
        csv << [email]
      end
    end
  end
end
