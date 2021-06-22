class Tune < ActiveRecord::Base
    validates :title, presence: true
    
    # Find artist in the db.
    def self.get_artist(artist)
        Tune.where(artist: artist).all
    end
end