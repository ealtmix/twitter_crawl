Given /^I am on the TwitterCrawler home page$/ do
  visit crawl_path
end


When /^I search for "(.*?)" and "(.*?)"$/ do |word1, word2|
  fill_in 'Word1', :with => word1
  fill_in 'Word2', :with => word2
  click_button 'Search'
end

Then /^all tweets shown should contain either "(.*?)" or "(.*?)"$/ do |word1, word2| 
  result=false
  all("tr").each do |tr|
    if tr.has_content?(word1) || tr.has_content?(word2)
      result = true
      break
    end
  end  
  assert result
end



Given /^I am tracking "(.*?)" and "(.*?)"$/ do |word1, word2|
  fill_in 'Word1', :with => word1
  fill_in 'Word2', :with => word2
  click_button 'Search'
end

And /^I am on the TwitterCrawler home page$/ do
  visit crawl_path
end

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

def user
  @user ||= FactoryGirl.create :user
end


Given /^a signed in user$/ do
  user
  sign_in(@user.email, @user.password)
end

Given /^a user has an account$/ do
  user
end


When /^the user logs in$/ do
  sign_in(@user.email, @user.password)
end

When /^the user logs out$/ do
  click_link ('Sign out')
end

When /^the user tries to log in with invalid information$/ do
  sign_in("incorrect-email", "incorrect-password")
end

Then /^the user should see a sign out link$/ do
  page.should have_link('Sign out')
end

Then /^the user should see an log in success message$/ do
  should have_success_message('Signed in successfully.')
end

When /^the user should see an log out success message$/ do
  should have_success_message('Signed out successfully.')
end

Then /^the user should see an log in error message$/ do
  should have_error_message('Invalid email or password.')
end
  



