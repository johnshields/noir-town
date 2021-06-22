require 'spec_helper'

describe Tune do
  describe "GET #tunes by same artist" do
    it "should find tunes by the same artist" do
      Tune.should_receive(:find_artist).with('Night Lights')
      Tune.find_artist('Night Lights')
    end
    
    it "should not find tunes by different artists" do
        Tune.should_not_receive(:find_artist).with('Night Lights')
    end
  end
end  