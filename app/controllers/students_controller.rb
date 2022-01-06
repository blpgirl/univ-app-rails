class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :require_same_student, only: [:edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "You have successfully signed up."
      # to show page
      redirect_to @student
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "You have successfully updated your profile."
      redirect_to @student
    else
      render "edit"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email, :password)
    end

    def require_same_student
      if current_user != @student
        flash[:notice] = "You can only edit your own profile."
        redirect_to student_path(current_user)
      end
    end
end
