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
    if @answer.save
      @notification = "🙌 Votre réponse a bien été prise en compte! 🙌"
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
end
