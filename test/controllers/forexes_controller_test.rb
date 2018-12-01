require 'test_helper'

class ForexesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forex = forexes(:one)
  end

  test "should get index" do
    get forexes_url
    assert_response :success
  end

  test "should get new" do
    get new_forex_url
    assert_response :success
  end

  test "should create forex" do
    assert_difference('Forex.count') do
      post forexes_url, params: { forex: { currency: @forex.currency, value: @forex.value } }
    end

    assert_redirected_to forex_url(Forex.last)
  end

  test "should show forex" do
    get forex_url(@forex)
    assert_response :success
  end

  test "should get edit" do
    get edit_forex_url(@forex)
    assert_response :success
  end

  test "should update forex" do
    patch forex_url(@forex), params: { forex: { currency: @forex.currency, value: @forex.value } }
    assert_redirected_to forex_url(@forex)
  end

  test "should destroy forex" do
    assert_difference('Forex.count', -1) do
      delete forex_url(@forex)
    end

    assert_redirected_to forexes_url
  end
end
