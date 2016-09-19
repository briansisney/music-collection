class MusicPlayer

  def initialize
    $albums = ObjectSpace.each_object(Album)
    Message.welcome
    puts ""
    run
  end

  private

  def run
    while true
      @input = gets.chomp.strip
      apply_input
      puts ""
    end
  end

  def apply_input
    game_over?
    begin
      action
    rescue => e
      Message.invalid_command
    end
  end

  def game_over?
    if @input == 'quit'
      Message.quit
      exit
    end
  end

  def action
    Collection.new(paramaters).send(command)
  end

  def command
    @input.split[0]
  end

  def paramaters
    @input.split.drop(1).join(" ")
  end

end


