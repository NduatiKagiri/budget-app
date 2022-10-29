require 'test_helper'

class TransaktionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaktion = transaktions(:one)
  end

  test 'should get index' do
    get transaktions_url
    assert_response :success
  end

  test 'should get new' do
    get new_transaktion_url
    assert_response :success
  end

  test 'should create transaktion' do
    assert_difference('Transaktion.count') do
      post transaktions_url, params: { transaktion: { amount: @transaktion.amount, name: @transaktion.name } }
    end

    assert_redirected_to transaktion_url(Transaktion.last)
  end

  test 'should show transaktion' do
    get transaktion_url(@transaktion)
    assert_response :success
  end

  test 'should get edit' do
    get edit_transaktion_url(@transaktion)
    assert_response :success
  end

  test 'should update transaktion' do
    patch transaktion_url(@transaktion),
          params: { transaktion: { amount: @transaktion.amount, name: @transaktion.name } }
    assert_redirected_to transaktion_url(@transaktion)
  end

  test 'should destroy transaktion' do
    assert_difference('Transaktion.count', -1) do
      delete transaktion_url(@transaktion)
    end

    assert_redirected_to transaktions_url
  end
end
