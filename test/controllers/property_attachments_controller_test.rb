require 'test_helper'

class PropertyAttachmentsControllerTest < ActionController::TestCase
  setup do
    @property_attachment = property_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:property_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property_attachment" do
    assert_difference('PropertyAttachment.count') do
      post :create, property_attachment: { avatar: @property_attachment.avatar, property_id: @property_attachment.property_id }
    end

    assert_redirected_to property_attachment_path(assigns(:property_attachment))
  end

  test "should show property_attachment" do
    get :show, id: @property_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property_attachment
    assert_response :success
  end

  test "should update property_attachment" do
    patch :update, id: @property_attachment, property_attachment: { avatar: @property_attachment.avatar, property_id: @property_attachment.property_id }
    assert_redirected_to property_attachment_path(assigns(:property_attachment))
  end

  test "should destroy property_attachment" do
    assert_difference('PropertyAttachment.count', -1) do
      delete :destroy, id: @property_attachment
    end

    assert_redirected_to property_attachments_path
  end
end
