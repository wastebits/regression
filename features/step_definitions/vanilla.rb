Given("I'm member of {string}") do |string|
  @browser = Watir::Browser.new

  @browser.goto 'https://qa.wastebits.io/login'

  # TODO: move email and password to application.yml
  email = @browser.text_field name: 'email'
  email.exists?
  email.set 'psullivan+regression+approver@wastebits.com'

  password = @browser.text_field name: 'password'
  password.exists?
  password.set 'Wastebits123$'

  btn = @browser.button text: 'Log In'
  btn.exists?
  btn.click

  company_name = @browser.div text: string

  expect(company_name.exists?)
end

When("I start a new Profile") do
  start_profile = @browser.span text: 'Start Profile'
  start_profile.click

  expect(profile_status).to eq('Draft')
end

When("I specified the profile name {string}") do |string|
  profile_name_input = @browser.text_field name: 'profileName'
  profile_name_input.set string

  save = @browser.button text: 'Save'
  save.exists?
  save.click

  expect(profile_name).to eq('Rotten Cucumbers')
end

When("I specified the generator {string}") do |string|
  search = @browser.text_field(placeholder: 'Search for a generator...')
  search.set string


  company = @browser.div(text: string)
  company.exists?
  company.click

  expect(generator_name).to eq('Wastebits Cucumber Factory')
end

When("I specified the waste facility {string}") do |string|
  @browser.lis(class_name: 'module--profile-places--tab')[1].click

  search = @browser.text_field(placeholder: 'Search for a facility...')
  search.set string

  sleep 2

  waste_facilities_list = # <ul> tag
    @browser.element(css: '[test-id="profile-places-search-results"]')

  waste_facilities_list.exists?
  waste_facilities_list.lis.first.click

  expect(waste_facility_name).to eq('Wastebits Cucumber Composter')
end

When("I specified the billing company {string}") do |string|
  @browser.lis(class_name: 'module--profile-places--tab')[2].click

  search = @browser.text_field(placeholder: 'Search for a billing...')
  search.set string

  sleep 2

  billing_companies_list = # <ul> tag
    @browser.element(css: '[test-id="profile-places-search-results"]')

  billing_companies_list.exists?
  billing_companies_list.lis.first.click

  expect(billing_company_name).to eq('Wastebits Cucumber Composter')
end


When("I {string} the Waste Profile for approval") do |string|
  click_submit_for_approval_and_save_button
  click_submit_for_approval_button

  sleep 2

  expect(profile_status).to eq('Pending')
end

When("I go to the Profile list") do
  sleep 5
  account_menu = @browser.element(css: '[test-id="account-menu"]')
  account_menu.exists?
  account_menu.hover
  @browser.li(text: 'Profiles').click

  sleep 2

  # TODO: handle pagination if needed
  if @browser.span(class_name: 'fa-step-forward').exists?
    @browser.span(class_name: 'fa-step-forward').click
    sleep 2
  end

  url = 'https://qa.wastebits.io/companies/27556/profiles'

  expect(@browser.url).to eq url
end

Then("I see my Waste Profile in {string} status") do |string|
  @browser.span(class_name: 'fa-step-forward').click

  sleep 2

  last_profile_status = @browser.trs.last.children[1].text

  expect(last_profile_status).to eq(' Pending')

  @browser.close
end
