module FormSubmissionHelpers
  def login_user(email, password)

  end

  def profile_status
    @browser.element(css: '[test-id="profile-status"]').text
  end

  def profile_name
    @browser.text_field(name: 'profileName').value
  end

  def generator_name
    @browser.element(css: '[test-id="profile-places-info"]').text
  end

  def waste_facility_name
    @browser.element(css: '[test-id="profile-places-info"]').text
  end

  def billing_company_name
    @browser.element(css: '[test-id="profile-places-info"]').text
  end

  def click_submit_for_approval_and_save_button
    @browser.element(css: '[test-id="submit-and-save"]').click
  end

  def click_submit_for_approval_button
    @browser.element(css: '[test-id="confirm-modal"]').click
  end
end

World(FormSubmissionHelpers)
