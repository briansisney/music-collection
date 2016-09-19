require "spec_helper"

describe Collection do

  before(:all) do
    $albums = ObjectSpace.each_object(Album)
    @c_1 = Collection.new("\"title_1\" \"artist\"")
    @title_2 = 'title_2'
    @c_2 = Collection.new("\"#{@title_2}\" \"artist\"")
    @c_3 = Collection.new("\"title_3\" \"artist\"")
    @c_4 = Collection.new("\"title_4\" \"artist\"")
    @c_5 = Collection.new("\"title_5\"")
    @a1 = Album.new("title_5","artist")
    @a2 = Album.new("title_6", "artist_6")
    @a3 = Album.new("title_20", "artist")
  end

  context "#add" do
    it "adds a album" do
      pre_count = $albums.count
      @c_1.add
      expect($albums.count).to eq(pre_count+1)
    end

    it "does not add a duplicate album" do
      expect($albums.find_all{|s| s.title == @title_2}.count).to eq(0)
      @c_2.add
      @c_2.add
      expect($albums.find_all{|s| s.title == @title_2}.count).to eq(1)
    end

    it "returns the add message" do
      expect{@c_3.add}.to output("Added title_3 by artist\n").to_stdout
    end  

    it "returns the add error message" do
      @c_4.add
      expect{@c_4.add}.to output("Sorry, that title has already been added\n").to_stdout
    end

    it "does not add a album with nil artist" do
      pre_count = $albums.count
      @c_5.add
      expect($albums.count).to eq(pre_count)
    end

  end

  context "#show" do

    context "all" do
      it "shows all the albums" do
        expect(Collection.new("all").show.count).to be >= 2
      end
    end

    context "all by $artist" do
      it "shows all the albums only by $artist" do
        expect{Collection.new("all by \"artist_6\"").show}.to output("title_6 by artist_6 (unplayed)\n").to_stdout
      end

      it "returns a message when there are no albums by $artist" do
        expect{Collection.new("all by \"artist_no_way\"").show}.to  output("There are no records with that filter.\n").to_stdout
      end
    end

    context "unplayed" do
      it "shows all unplayed albums" do
        expect(Collection.new("unplayed").show.count).to be >= 2
      end
    end

    context "unplayed by $artist" do
      it "shows all the unplayed albums by $artist" do
      expect{Collection.new("unplayed by \"artist_6\"").show}.to output("title_6 by artist_6 (unplayed)\n").to_stdout
      end
    end

  end

  context "#play" do
    it "it changes the album status to played" do
      expect(@a3.status).to eq('unplayed')
      Collection.new("\"title_20\"").play
      expect(@a3.status).to eq('played')
    end

    it "it returns the correct message" do
      expect{Collection.new("\"title_20\"").play}.to output("You're listening to \"title_20\"\n").to_stdout
    end

    it "returns a message when there are no albums" do
      expect{Collection.new("\"title_no_way_jose\"").play}.to output("There are no records with that filter.\n").to_stdout
    end

  end

  
end