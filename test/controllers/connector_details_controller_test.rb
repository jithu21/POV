require 'test_helper'

class ConnectorDetailsControllerTest < ActionController::TestCase
  setup do
    @connector_detail = connector_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:connector_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create connector_detail" do
    assert_difference('ConnectorDetail.count') do
      post :create, connector_detail: { connectorname: @connector_detail.connectorname, credentials: @connector_detail.credentials, cronexpression: @connector_detail.cronexpression, datasource: @connector_detail.datasource, filetype: @connector_detail.filetype, mapping: @connector_detail.mapping, projectname: @connector_detail.projectname }
    end

    assert_redirected_to connector_detail_path(assigns(:connector_detail))
  end

  test "should show connector_detail" do
    get :show, id: @connector_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @connector_detail
    assert_response :success
  end

  test "should update connector_detail" do
    patch :update, id: @connector_detail, connector_detail: { connectorname: @connector_detail.connectorname, credentials: @connector_detail.credentials, cronexpression: @connector_detail.cronexpression, datasource: @connector_detail.datasource, filetype: @connector_detail.filetype, mapping: @connector_detail.mapping, projectname: @connector_detail.projectname }
    assert_redirected_to connector_detail_path(assigns(:connector_detail))
  end

  test "should destroy connector_detail" do
    assert_difference('ConnectorDetail.count', -1) do
      delete :destroy, id: @connector_detail
    end

    assert_redirected_to connector_details_path
  end
end
