class Album
  attr_accessor :title, :artist, :played

  def initialize(title, artist)
    @title=title
    @artist=artist
    @played=false
  end

  def all
    true
  end

  def status
    @played ? 'played' : 'unplayed'
  end

  def play
    @played=true
    self
  end

  def unplayed
    !@played
  end

  def by(artist)
    @artist.downcase == artist.downcase
  end
end
