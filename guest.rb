class Guest

  attr_reader :name, :wallet, :favourite_song_name, :favourite_song_artist, :bar_tab

  def initialize(name, wallet, favourite_song_name, favourite_song_artist, bar_tab)
    @name = name
    @wallet = wallet
    @favourite_song_name = favourite_song_name
    @favourite_song_artist = favourite_song_artist
    @bar_tab = bar_tab
  end

  def deduct_guest_wallet(amount)
    @wallet -= amount
  end

  def update_bar_tab(drink)
    @bar_tab += drink.price
  end
end
