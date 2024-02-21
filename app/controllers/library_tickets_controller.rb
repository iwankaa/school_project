class LibraryTicketsController < ApplicationController
  before_action :set_student
  before_action :set_library_ticket, only: %i[ show edit update destroy ]

  # GET /library_tickets or /library_tickets.json
  def index
    @library_ticket = @student.library_ticket
  end

  # GET /library_tickets/1 or /library_tickets/1.json
  def show
  end

  # GET /library_tickets/new
  def new
    @library_ticket = @student.library_ticket.build
  end

  # GET /library_tickets/1/edit
  def edit
  end

  # POST /library_tickets or /library_tickets.json
  def create
    # @message = Message.new(message_params)
    @library_ticket = @student.library_tickets.build(library_ticket_params)

    respond_to do |format|
      if @library_ticket.save
        format.html { redirect_to [@student, @library_ticket], notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @library_ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library_tickets/1 or /library_tickets/1.json
  def update
    respond_to do |format|
      if @library_ticket.update(library_ticket_params)
        format.html { redirect_to library_ticket_url(@library_ticket), notice: "Library ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @library_ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_tickets/1 or /library_tickets/1.json
  def destroy
    @library_ticket.destroy

    respond_to do |format|
      format.html { redirect_to library_tickets_url, notice: "Library ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_student
    @student = Student.find(params[:student_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_library_ticket
    # @message = Message.find(params[:id])
    @library_ticket = @student.library_tickets.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:library_ticket).permit(:book, :got_date, :back_date)
  end
end