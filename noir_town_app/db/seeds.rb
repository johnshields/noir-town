# Setup data to populate the Tunes db table.
more_tunes = [
    {:title => 'Set Fire To The Stars', :artist => 'Gruff Rhys',
        :album => 'Set Fire To The Stars',
        :description => 'Theme song from the film Set Fire To The Stars.',
        :release_date => '30-April-2015',
        :url => 'https://open.spotify.com/embed/track/5BesMcFI6Dh7Up6xbAGr0E'},
    {:title => 'Windswept', :artist => 'Johnny Jewel',
        :album => 'Windswept',
        :description => 'Dark and daunting number that was featured in the Twin Peaks Soundtrack.',
        :release_date => '10-May-2017',
        :url => 'https://open.spotify.com/embed/track/5WvO6j0OY3jGBaelGc0Mzq'},
    {:title => 'Kyrie', :artist => 'Andreas Utnem & Trygve Seim',
        :album => 'Purcor',
        :description => 'Relaxing tune filled with a noir vibe.',
        :release_date => '05-Nov-2010',
        :url => 'https://open.spotify.com/embed/track/0QOOl3uqJe0W16DjMDox7A'},
    {:title => 'While My Guitar Gently Weeps', :artist => 'Black Chamber',
        :album => 'Black Chamber',
        :description => 'Gritty rendition of the Beatles Classic.',
        :release_date => '10-Jan-2013',
        :url => 'https://open.spotify.com/embed/track/3HsWnFHOH1pgDEDkWSitIi'},
    {:title => 'Taxi Driver - Main Title', :artist => 'Bernard Hermann',
        :album => 'Taxi Driver',
        :description => 'Smooth saxophone work that fits the film perfectly.',
        :release_date => '08-Feb-1976',
        :url => 'https://open.spotify.com/embed/track/7xPefqZB6BBosOdfKJh9nJ'},
    {:title => 'Bigger Than Us', :artist => 'Jon Batiste',
        :album => 'Soul',
        :description => 'In the zone...',
        :release_date => '11-Oct-2020',
        :url => 'https://open.spotify.com/embed/track/50Ewq4wyDlTfbrmnfbOB9k'},
     {:title => 'Nightmare', :artist => 'Artie Shaw & His New Music',
        :album => 'Nightmare',
        :description => 'This tune is as gritty as it gets.',
        :release_date => '19-Oct-1938',
         :url => 'https://open.spotify.com/embed/track/7HNJvdLG1X542jQMHOyz7G'},
    {:title => 'Midnight, The Stars and You', :artist => 'Al Bowlly',
        :album => 'Midnight, The Stars and You',
        :description => 'If you hear this in a hotel, enjoy it while you can.',
        :release_date => '15-Aug-1934',
        :url => 'https://open.spotify.com/embed/track/2rglyjrtWKPtyarF0VCV0v'},
    {:title => 'Born To Be Blue', :artist => 'Chet Baker',
        :album => 'Baby Breeze',
        :description => 'Chet was always born to play this tune.',
        :release_date => '14-Nov-1964',
        :url => 'https://open.spotify.com/embed/track/2xJFkGXMv2NT1sHBzh5KyP'},
     {:title => "I've Got You Under My Skin", :artist => 'Frank Sinatra',
        :album => "Sinatra's Sinatra",
        :description => "Cause I've got you under my skin...",
        :release_date => '01-Aug-1963',
        :url => 'https://open.spotify.com/embed/track/1oVVDiRQJKscXj4G6tE52x'},
    {:title => 'Lament For The Living', :artist => 'Chet Baker',
        :album => 'On A Misty Night',
        :description => 'A misty tune indeed.',
        :release_date => '13-Sep-1996',
        :url => 'https://open.spotify.com/embed/track/62aN1PGR3eG6qaYzbsx9mS'},
]

more_tunes.each do |tune|
  Tune.create!(tune)
end