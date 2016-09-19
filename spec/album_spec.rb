require "spec_helper"

describe Album do
  before(:all) do
    @album = Album.new("title_album","artist_album")
    @album_2 = Album.new("title_album_2","artist_album_2")
  end

  context "#initialize" do
    it "sets title" do
      expect(@album.title).to eq("title_album")
    end

    it "sets artist" do
      expect(@album.artist).to eq("artist_album")
    end

    it "sets played default" do
      expect(@album.played).to eq(false)
    end  
  end

  context "#play" do
    it "sets played to true" do
      expect(@album_2.played).to eq(false)
      @album_2.play
      expect(@album_2.played).to eq(true)
      
    end

    it "returns self" do
      expect(@album_2.play).to eq(@album_2)
    end

  end
  
  context "#by" do
    it "returns true when artist is the same" do
      expect( @album.by('artist_album')).to eq(true)
     
    end

    it "returns true when artist if capitalization is different" do
      expect( @album.by('Artist_album')).to eq(true)
    end

    it "returns false when artist is different" do
      expect( @album.by('Nrtist_album')).to eq(false)
    end
  end
  
end

