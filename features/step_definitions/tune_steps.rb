# Step to populate the database.
Given /these tunes exist in the db/ do |tunes_table|
    tunes_table.hashes.each do |tune|
        Tune.create tune
    end
end

# Step to click on spotify preview.
When("I click on the preview") do
  find('[title=preview]').click
end

Then("I should hear the tune") do
  puts "tune playing....."
end

# Step to see if int tunes exist in database.
Then ("{int} seed tunes should exist") do |int|
    Tune.count.should be int.to_i
end

# Step for checking if fields are sorted.
Then ("I should see {string} before {string}") do |string, string2|
  expect(page.body.index(string) < page.body.index(string2))
end

# Step to pick option for search box.
Then("I pick {string} from the options box") do |string|
  select(string, :from => 'option')
end