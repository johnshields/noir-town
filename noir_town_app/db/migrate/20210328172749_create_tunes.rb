class CreateTunes < ActiveRecord::Migration
  def change
    create_table 'tunes' do |t|
      t.string 'title'
      t.string 'artist'
      t.string 'album'
      t.text 'description'
      t.date 'release_date'
      t.string 'url'  
      t.timestamps
    end
  end
end
