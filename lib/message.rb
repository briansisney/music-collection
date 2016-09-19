class Message

  def self.welcome
    puts "\nWelcome to your music collection!"
  end

  def self.no_records
    puts "There are no records with that filter."
  end

  def self.added(album)
    puts "Added #{album.title} by #{album.artist}"
  end
  def self.playing(album)
    puts "You're listening to \"#{album.title}\""
  end

  def self.quit
    puts "Bye!"
  end

  def self.full_meta(album)
    puts "#{album.title} by #{album.artist} (#{album.status})"
  end

  def self.meta(album)
    puts "#{album.title} by #{album.artist}"
  end

  def self.invalid_title
    puts "Sorry, that title has already been added"
  end

  def self.invalid_command
    puts "Sorry, I didn't understand that command. Please try again."
  end

  def self.fields_absent
    puts "Sorry, not enough information was given to add this album."
  end
end
