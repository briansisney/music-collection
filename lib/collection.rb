class Collection

  def initialize(params)
    @input = params
  end

  def add
    return if not_valid_album
    Message.added Album.new(@title, @artist)
  end

  def show
    display $albums.select { |album| query(album) }
  end

  def play
    album = $albums.find{ |album| same_title(album.title, format_input) }
    if album.nil?
      Message.no_records
    else
      Message.playing album.play
    end
  end

  private

  def display(results)
    return Message.no_records if results.count == 0
    results.each{ |album| Message.full_meta album }
  end

  def set_title_artist
    @title, @artist = format_input.split("\" \"")
  end

  def format_input
    @input[1..-2]
  end

  def not_valid_album
    set_title_artist
    nil_validation || duplicate
  end

  def nil_validation
    if @artist.nil? || @title.nil?
      Message.fields_absent
      true
    end
  end

  def duplicate
    if $albums.any? { |album| same_title(album.title, @title) }
      Message.invalid_title 
      true
    end
  end

  def same_title(one, two)
  	one.downcase == two.downcase
  end

  def command
    @input.split[0]
  end

  def artist
    @input.split("\"").drop(1)[-1]
  end

  def query(album)
    album.send(command) && (artist ? album.by(artist) : true )
  end

end
