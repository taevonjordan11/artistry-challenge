class ArtistInstrumentsController < ApplicationController
  def new
    @artist_instrument = ArtistInstrument.new

    @artists = Artist.all
    @instruments = Instrument.all
  end

  def create
    @artist_instrument = ArtistInstrument.new(artist_instrument_params)
    @artist_instrument.save

    redirect_to artist_path(@artist_instrument.artist)
  end

  private

  def artist_instrument_params
    params.require(:artist_instrument).permit(:artist_id, :instrument_id)
  end
end
