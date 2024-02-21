require "application_system_test_case"

class LibraryTicketsTest < ApplicationSystemTestCase
  setup do
    @library_ticket = library_tickets(:one)
  end

  test "visiting the index" do
    visit library_tickets_url
    assert_selector "h1", text: "Library tickets"
  end

  test "should create library ticket" do
    visit library_tickets_url
    click_on "New library ticket"

    fill_in "Back date", with: @library_ticket.back_date
    fill_in "Book", with: @library_ticket.book
    fill_in "Got date", with: @library_ticket.got_date
    fill_in "Student", with: @library_ticket.student_id
    click_on "Create Library ticket"

    assert_text "Library ticket was successfully created"
    click_on "Back"
  end

  test "should update Library ticket" do
    visit library_ticket_url(@library_ticket)
    click_on "Edit this library ticket", match: :first

    fill_in "Back date", with: @library_ticket.back_date
    fill_in "Book", with: @library_ticket.book
    fill_in "Got date", with: @library_ticket.got_date
    fill_in "Student", with: @library_ticket.student_id
    click_on "Update Library ticket"

    assert_text "Library ticket was successfully updated"
    click_on "Back"
  end

  test "should destroy Library ticket" do
    visit library_ticket_url(@library_ticket)
    click_on "Destroy this library ticket", match: :first

    assert_text "Library ticket was successfully destroyed"
  end
end
