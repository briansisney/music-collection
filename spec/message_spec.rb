require "spec_helper"

describe Message do
  before(:all) do
    @album = Album.new("title","artist")
  end

  context "welcome" do
    it "returns the correct message" do
      expect { Message.welcome }.to output("\nWelcome to your music collection!\n").to_stdout
    end
  end

  context "no_records" do
    it "returns the correct message" do
      expect { Message.no_records }.to output("There are no records with that filter.\n").to_stdout
    end
  end

  context "added(album)" do
    it "returns the correct message" do
      expect { Message.added(@album) }.to output("Added title by artist\n").to_stdout
    end
  end

  context "playing(album)" do
    it "returns the correct message" do
      expect { Message.playing(@album) }.to output("You're listening to \"title\"\n").to_stdout
    end
  end

  context "quit" do
    it "returns the correct message" do
      expect { Message.quit }.to output("Bye!\n").to_stdout
    end
  end

  context "full_meta(album)" do
    it "returns the correct message" do
      expect { Message.full_meta(@album) }.to output("title by artist (unplayed)\n").to_stdout
    end
  end

  context "meta(album)" do
    it "returns the correct message" do
      expect { Message.meta(@album) }.to output("title by artist\n").to_stdout
    end
  end

  context "invalid_title" do
    it "returns the correct message" do
      expect { Message.invalid_title }.to output("Sorry, that title has already been added\n").to_stdout
    end
  end

  context "invalid_command" do
    it "returns the correct message" do
      expect { Message.invalid_command }.to output("Sorry, I didn't understand that command. Please try again.\n").to_stdout
    end
  end

  context "fields_absent" do
    it "returns the correct message" do
      expect { Message.fields_absent }.to output("Sorry, not enough information was given to add this album.\n").to_stdout
    end
  end

end
