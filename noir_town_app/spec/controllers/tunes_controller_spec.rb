require 'rails_helper'

# Refs: 
# https://dev.to/ionabrabender/testing-crud-with-rspec-and-rails-186k
# https://rubyyagi.com/rspec-request-spec/
# https://stackoverflow.com/q/42218228/15289693
# https://medium.com/swlh/9-tips-to-write-better-rspec-5569b45fb1a1
describe TunesController, type: 'controller' do
  # Set up mocks.
  before(:each) do
    @mock_new_tune = { :title => 'Godfather', :artist => 'Terence Blanchard',
                   :album => 'She Hate Me', :description => 'Cool tune.',
                   :release_date => '2004-01-13', :url => 'tune_url' }
    @mock_lacking_tune = { :title => 'Skylark', :album => 'Late Night Jazz' }
    @mock_tune = Tune.create!(@mock_new_tune)
    @lacking_mock_tune = Tune.create!(@mock_lacking_tune)
  end
    
  # Test for create - /tunes/new
  describe "GET/POST #create & #new" do
    it "should display the new page" do
        get :new
        expect(response).to render_template(:new)
     end
    it "should create a new tune" do
      expect {
        post :create, tune: @mock_new_tune
      }.to change(Tune, :count).by(1)
    end
    it "the new tune should be in the db" do
      post :create, tune: @mock_new_tune
      expect(assigns(:tune).description).to include("Cool tune.")
    end
    it "should redirect to the home page" do
      post :create, tune: @mock_new_tune
      expect(response).to redirect_to(:action => 'index')
    end
  end
    
  # Test for show - /
  describe "GET #index" do
    it "should display the home page" do
        get :index
        expect(response).to render_template(:index)
    end
    # Testing searching params - no matter the case input.
    test_options = ['1', '2', '3']
    test_searches = ['gOdfaTher', 'TERENCE', 'she hate me']
      
    test_options.zip(test_searches) do |t_option, t_search|
       it "should take the params: #{t_search} & #{t_option} to return a search" do
          get :index, search: t_search, option: t_option
          expect(assigns(:tunes)).to include(@mock_tune)
       end
    end
  end
    
  # Test for show - /tunes/id
  describe "GET #show" do
    it "should render the show page of a tune" do
        get :show, id: @mock_tune
        expect(response).to render_template(:show)
    end
    it "should display details of a tune" do
          get :show, id: @mock_tune
          expect(assigns(:tune).title).to include("Godfather")
    end
  end
    
  # Test for update - /tunes/id/edit
  describe "PUT #update" do
    it "should load the requested tune" do
        put :update, id: @mock_tune, tune: @mock_new_tune
        expect(assigns(:tune)).to eq(@mock_tune)
    end
    it "should update a requested tune" do
        put :update, id: @mock_tune, tune: @mock_new_tune
        @mock_tune.reload
        expect(@mock_tune.title).to include("Godfather")
    end
    it "should redirect to the home page" do
        put :update, id: @mock_tune, tune: @mock_new_tune
        expect(response).to redirect_to(:action => 'index')
    end
  end
    
  # Test for destroy - /tunes/id
  describe "DELETE #destroy" do
      it "should remove a tune" do
          expect {
            delete :destroy, id: @mock_tune
          }.to change(Tune, :count).by(-1) 
      end
      it "should redirect to the home page" do
         delete :destroy,id: @mock_tune
         expect(response).to redirect_to(:action => 'index')
      end
  end
    
  # Test for return value of #query.
  describe "DEF #query" do
    test_fields = ['title', 'artist', 'album']
    test_values = ['Godfather', 'Terence Blanchard', 'She Hate Me']
      
    test_fields.zip(test_values) do |t_field, t_value|
       context "When a search for #{t_field} is picked" do
         it "should find a tune in the db by #{t_field}" do
            @tune_con = TunesController.new
            @def_query = @tune_con.query(t_field, t_value, "title")
            expect(@def_query).to include(@mock_tune)
         end
       end
    end
  end

  # Test for find_artist
  describe "GET #find_artist" do
    context "When specified tune has an artist" do
      it "should find tunes by the same artist" do
        Tune.should_receive(:find_artist).with('Night Lights')
        Tune.find_artist('Night Lights')
      end
    end

    context "When specified tune has no artist" do
      it "should redirect to the home page" do
        Tune.should_not_receive(:find_artist).with('Night Lights')
        redirect_to tunes_path
      end
    end
    it "it should take an ID param and display the artist" do
        get :find_artist, id: @mock_tune
        expect(@mock_tune.artist).to include("Terence Blanchard")
    end
  end
    it "should redirect_to index if a tune has no artist info" do
        get :find_artist, id: @lacking_mock_tune
        expect(response).to redirect_to(:action => 'index')
    end
end