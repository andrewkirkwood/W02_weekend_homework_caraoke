class Guest

  attr_reader :name, :wallet, :favourite_song_name, :favourite_song_artist

  def initialize(name, wallet, favourite_song_name, favourite_song_artist)
    @name = name
    @wallet = wallet
    @favourite_song_name = favourite_song_name
    @favourite_song_artist = favourite_song_artist
  end

  def deduct_guest_wallet(amount)
    @wallet -= amount
  end
end
