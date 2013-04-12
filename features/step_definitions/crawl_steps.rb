Given /^I am on the TwitterCrawler home page$/ do
  visit("/index")
end


When /^I search for "(.*?)"$/ do |word1|
  fill_in 'keywords', :with => word1
  click_button 'Submit'
end

Then /^all tweets shown should contain "(.*?)"$/ do |word1| 
  result=false
  all("tr").each do |tr|
    if tr.has_content?(word1)
      result = true
      break
    end
  end  
  assert result
end



Given /^I am tracking "(.*?)"$/ do |word1|
  fill_in 'keywords', :with => word1
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

