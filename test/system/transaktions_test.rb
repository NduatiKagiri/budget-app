require 'application_system_test_case'

class TransaktionsTest < ApplicationSystemTestCase
  setup do
    @transaktion = transaktions(:one)
  end

  test 'visiting the index' do
    visit transaktions_url
    assert_selector 'h1', text: 'Transaktions'
  end

  test 'should create transaktion' do
    visit transaktions_url
    click_on 'New transaktion'

    fill_in 'Amount', with: @transaktion.amount
    fill_in 'Name', with: @transaktion.name
    click_on 'Create Transaktion'

    assert_text 'Transaktion was successfully created'
    click_on 'Back'
  end

  test 'should update Transaktion' do
    visit transaktion_url(@transaktion)
    click_on 'Edit this transaktion', match: :first

    fill_in 'Amount', with: @transaktion.amount
    fill_in 'Name', with: @transaktion.name
    click_on 'Update Transaktion'

    assert_text 'Transaktion was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Transaktion' do
    visit transaktion_url(@transaktion)
    click_on 'Destroy this transaktion', match: :first

    assert_text 'Transaktion was successfully destroyed'
  end
end
