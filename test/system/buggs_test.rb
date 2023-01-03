# frozen_string_literal: true

require 'application_system_test_case'

class BuggsTest < ApplicationSystemTestCase
  setup do
    @bugg = buggs(:one)
  end

  test 'visiting the index' do
    visit buggs_url
    assert_selector 'h1', text: 'Buggs'
  end

  test 'should create bugg' do
    visit buggs_url
    click_on 'New bugg'

    fill_in 'Description', with: @bugg.description
    fill_in 'Startdate', with: @bugg.startdate
    fill_in 'Status', with: @bugg.status
    fill_in 'Title', with: @bugg.title
    click_on 'Create Bugg'

    assert_text 'Bugg was successfully created'
    click_on 'Back'
  end

  test 'should update Bugg' do
    visit bugg_url(@bugg)
    click_on 'Edit this bugg', match: :first

    fill_in 'Description', with: @bugg.description
    fill_in 'Startdate', with: @bugg.startdate
    fill_in 'Status', with: @bugg.status
    fill_in 'Title', with: @bugg.title
    click_on 'Update Bugg'

    assert_text 'Bugg was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Bugg' do
    visit bugg_url(@bugg)
    click_on 'Destroy this bugg', match: :first

    assert_text 'Bugg was successfully destroyed'
  end
end
