require "test_helper"

class MarksListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marks_list = marks_lists(:one)
  end

  test "should get index" do
    get marks_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_marks_list_url
    assert_response :success
  end

  test "should create marks_list" do
    assert_difference("MarksList.count") do
      post marks_lists_url, params: { marks_list: { got_at: @marks_list.got_at, mark: @marks_list.mark, subject: @marks_list.subject } }
    end

    assert_redirected_to marks_list_url(MarksList.last)
  end

  test "should show marks_list" do
    get marks_list_url(@marks_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_marks_list_url(@marks_list)
    assert_response :success
  end

  test "should update marks_list" do
    patch marks_list_url(@marks_list), params: { marks_list: { got_at: @marks_list.got_at, mark: @marks_list.mark, subject: @marks_list.subject } }
    assert_redirected_to marks_list_url(@marks_list)
  end

  test "should destroy marks_list" do
    assert_difference("MarksList.count", -1) do
      delete marks_list_url(@marks_list)
    end

    assert_redirected_to marks_lists_url
  end
end
