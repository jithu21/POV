require 'test_helper'

class DailymailsControllerTest < ActionController::TestCase
  setup do
    @dailymail = dailymails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailymails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dailymail" do
    assert_difference('Dailymail.count') do
      post :create, dailymail: { : @dailymail., : @dailymail., adunit: @dailymail.adunit, bidrate: @dailymail.bidrate, brandid: @dailymail.brandid, brandname: @dailymail.brandname, browser: @dailymail.browser, campaignid: @dailymail.campaignid, clearprice: @dailymail.clearprice, connectionspeed: @dailymail.connectionspeed, country: @dailymail.country, dealid: @dailymail.dealid, devicetype: @dailymail.devicetype, dma: @dailymail.dma, domain: @dailymail.domain, dspname: @dailymail.dspname, language: @dailymail.language, os: @dailymail.os, pricelevel: @dailymail.pricelevel, requestid: @dailymail.requestid, siteid: @dailymail.siteid, sitename: @dailymail.sitename, slotid: @dailymail.slotid, state: @dailymail.state, timestamp: @dailymail.timestamp, type: @dailymail.type, usermatchstatus: @dailymail.usermatchstatus, winrate: @dailymail.winrate }
    end

    assert_redirected_to dailymail_path(assigns(:dailymail))
  end

  test "should show dailymail" do
    get :show, id: @dailymail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dailymail
    assert_response :success
  end

  test "should update dailymail" do
    patch :update, id: @dailymail, dailymail: { : @dailymail., : @dailymail., adunit: @dailymail.adunit, bidrate: @dailymail.bidrate, brandid: @dailymail.brandid, brandname: @dailymail.brandname, browser: @dailymail.browser, campaignid: @dailymail.campaignid, clearprice: @dailymail.clearprice, connectionspeed: @dailymail.connectionspeed, country: @dailymail.country, dealid: @dailymail.dealid, devicetype: @dailymail.devicetype, dma: @dailymail.dma, domain: @dailymail.domain, dspname: @dailymail.dspname, language: @dailymail.language, os: @dailymail.os, pricelevel: @dailymail.pricelevel, requestid: @dailymail.requestid, siteid: @dailymail.siteid, sitename: @dailymail.sitename, slotid: @dailymail.slotid, state: @dailymail.state, timestamp: @dailymail.timestamp, type: @dailymail.type, usermatchstatus: @dailymail.usermatchstatus, winrate: @dailymail.winrate }
    assert_redirected_to dailymail_path(assigns(:dailymail))
  end

  test "should destroy dailymail" do
    assert_difference('Dailymail.count', -1) do
      delete :destroy, id: @dailymail
    end

    assert_redirected_to dailymails_path
  end
end
