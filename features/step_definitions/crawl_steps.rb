Given /^the following tweets are displayed on TwitterCrawler:$/ do |tweet_table|
  tweet_table.hashes.each do |tweet|
    Crawls.create!(tweet)
  end
end

Given /^I am on the TwitterCrawler home page$/ do
  visit crawls_path
end


When /^I search for "(.*?)"$/ do |word1|
  fill_in 'word_to_track', :with => word1
  click_button 'Submit'
end

Then /^all tweets shown should contain "(.*?)"$/ do |word| 
  result=false
  all("h3").each do |h3|
    if h3.has_content?(word)
      result=true
      break
    end
  end  
  assert result
end



Given /^I am tracking "(.*?)"$/ do |word1|
  fill_in 'word_to_track', :with => word1
  click_button 'Submit'
end

#And /^I am on the TwitterCrawler home page$/ do
#  visit('/index')
#end

When /^I remove "(.?)" from the keywords$/ do |word|
  fill_in 'remove_word', :with => word
  click_button 'Remove'
end

Then /^I should not see "(.?)" displayed$/ do |word|
  result=true
  all("tr").each do |tr|
    if tr.has_content?(word)
      result = false
      break
    end
  end  
  assert result
end
  
But /^I should see "(.?)" displayed$/ do |word|
  result=false
  all("tr").each do |tr|
    if tr.has_content?(word)
      result = true
      break
    end
  end  
  assert result
end

