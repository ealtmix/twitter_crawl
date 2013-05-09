Given /^the following tweets are displayed on TwitterCrawler:$/ do |tweet_table|
  tweet_table.hashes.each do |tweet|
    Crawls.create!(tweet)
  end
end

Given /^I am on the TwitterCrawler home page$/ do
  visit crawls_path
end


When /^I search for "(.*?)" and "(.*?)"$/ do |word1,word2|
  fill_in 'word1', :with => word1
  fill_in 'word2', :with => word2
  click_button 'Track'
end

Then /^all tweets shown should contain "(.*?)" or "(.*?)"$/ do |word1,word2| 
  result=false
  all("h4").each do |h4|
    if (h4.has_content?(word1) || h4.has_content(word2))
      result=true
      break
    end
  end  
  assert result
end


When(/^I choose "(.*?)" for the color of the first keyword$/) do |color|
  # select the corresponding color from the drop-down menu
  select(color, :from => 'color1')
end

When(/^I choose "(.*?)" for the color of the second keyword$/) do |color|
  # select the corresponding color from the drop-down menu
  select(color, :from => 'color2')
end

Then(/^I should see the pin at "(.*?)" is "(.*?)"$/) do |city, color|
  result=false
  if params[marker_colors][city] == color
     result=true
  end
  assert result
end


Then /^I should see a map$/ do
	page.should have_css('div#mapDiv')
end

