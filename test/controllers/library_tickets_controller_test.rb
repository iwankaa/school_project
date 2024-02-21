require "test_helper"

class LibraryTicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library_ticket = library_tickets(:one)
  end

  test "should get index" do
    get library_tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_library_ticket_url
    assert_response :success
  end

  test "should create library_ticket" do
    assert_difference("LibraryTicket.count") do
      post library_tickets_url, params: { library_ticket: { back_date: @library_ticket.back_date, book: @library_ticket.book, got_date: @library_ticket.got_date, student_id: @library_ticket.student_id } }
    end

    assert_redirected_to library_ticket_url(LibraryTicket.last)
  end

  test "should show library_ticket" do
    get library_ticket_url(@library_ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_ticket_url(@library_ticket)
    assert_response :success
  end

  test "should update library_ticket" do
    patch library_ticket_url(@library_ticket), params: { library_ticket: { back_date: @library_ticket.back_date, book: @library_ticket.book, got_date: @library_ticket.got_date, student_id: @library_ticket.student_id } }
    assert_redirected_to library_ticket_url(@library_ticket)
  end

  test "should destroy library_ticket" do
    assert_difference("LibraryTicket.count", -1) do
      delete library_ticket_url(@library_ticket)
    end

    assert_redirected_to library_tickets_url
  end
end
