require "spec_helper"

describe MoviesController, :type => :controller do
  describe "similar" do
    before :each do
      Movie.create(title:'Shamu',rating:'pg',director:'Leo',release_date:'1977-05-25')
      Movie.create(title:'Whale',rating:'pg',director:'Leo',release_date:'1987-05-25')
      Movie.create(title:'Dolphin',rating:'pg',director:'Dolph Lundgren',release_date:'1997-05-25')
      Movie.create(title:'Dolph Lundgren',rating:'pg',director:'Dolphin',release_date:'2007-05-25')
    end
    it "finds similar movies" do
      get :similar, :id => '1'
      assert_not_nil assigns(:movies)
      expect(assigns(:movies).length).to eq 2
    end
  end
end
