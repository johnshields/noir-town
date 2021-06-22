module NavigationHelpers
  def path_to(page_name)
    case page_name

    # Step to go the Home Page.
    when /^the (Noir Town )?home\s?page$/ then '/tunes'
       
    # Step to go to the /tune/new Page
    when /^the Add a new Tune page/ then '/tunes/new'
        
    # Step to go to the /tune/id/edit Page
    when /^the edit page for "(.*)"$/i
        edit_tune_path(Tune.find_by_title($1))
     
    # Step to go to the /tunes/id Page
    when /^the details page for "(.*)"$/i
        tune_path(Tune.find_by_title($1))
    
    # Step to go the Artist Page.
    when /^the Tunes Page for "(.*)"$/i
        artist_path(Tune.find_by_title($1))
        
        
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
