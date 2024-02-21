class MarksController < ApplicationController
  before_action :set_student
  before_action :set_mark, only: %i[ show edit update destroy ]

  def index
    @marks = @student.marks
  end

  def show
  end

  def new
    @mark = @student.marks.build
  end

  def edit
  end

  def create
    @mark = @student.marks.build(mark_params)

    respond_to do |format|
      if @mark.save
        format.turbo_stream do
         render turbo_stream: [
          turbo_stream.update('new_mark', 
                               partial: "marks/form", 
                               locals: {mark: Mark.new}),
          turbo_stream.prepend('marks', 
                               partial: "marks/mark", 
                               locals: {mark: @mark})                     
         ]
        end
        format.html { redirect_to [@student, @mark], notice: "Mark was successfully created." }
        format.json { render :show, status: :created, location: @mark }
      else
        format.turbo_stream do
          render turbo_stream: [
           turbo_stream.update('new_mark', 
                                partial: "marks/form", 
                                locals: {mark: @mark})
          ]
         end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mark.update(mark)
        format.turbo_stream do 
          render turbo_stream: [
            turbo_stream.update(@mark,
                                partial: "marks/mark",
                                locals: {mark: @mark}),
            turbo_stream.update('notice', "Mark #{@mark.id} updated")
          ]
        end
        format.html { redirect_to [@student, @mark], notice: "Mark was successfully updated." }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.turbo_stream do 
          render turbo_stream: turbo_stream.update(@mark,
                                                   partial: "marks/form",
                                                   locals: {mark: @mark})
        end
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to [@student, :marks], notice: "Mark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_student
      @student = Student.find(params[:student_id])
    end

    def set_mark
      @mark = @student.marks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mark_params
      params.require(:mark).permit(:subject, :mark, :got_date)
    end
end