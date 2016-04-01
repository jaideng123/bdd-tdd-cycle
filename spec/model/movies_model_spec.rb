require "spec_helper"

describe Movie do
  describe "funtions" do
    before :each do
      Movie.create(title:'Shamu',rating:'pg',director:'Leo',release_date:'1977-05-25')
      Movie.create(title:'Whale',rating:'pg',director:'Leo',release_date:'1977-05-25')
      Movie.create(title:'Dolphin',rating:'pg',director:'Dolph Lundgren',release_date:'1977-05-25')
      Movie.create(title:'Dolph Lundgren',rating:'pg',director:'Dolphin',release_date:'1977-05-25')
    end
    it "finds similar movies" do
      @movie = Movie.where("title='Shamu'").first
      expect(Movie.similar(@movie).length).to eq(2)
    end
  end
end