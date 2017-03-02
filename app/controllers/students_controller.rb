class StudentsController < ApplicationController
  def index
  	@students = Student.all
  end

  def new
  	@student = Student.new
  end
  
  def create
  	@student = Student.create(student_params)
  	
  	if @student.save
  		flash.now[:success] = "New Student Have Registered To Your System"
  		redirect_to root_path
  	else
  		flash.now[:danger] = "Unable To Register New Student"
  		render :new
  	end
  end
  
  def show
  	@student = Student.find(params[:id])
  end
  
  def edit
  	@student = Student.find(params[:id])
  end
  
  def update
  	@student = Student.find(params[:id])
  	
  	if @student.update(student_params)
  		flash.now[:success] = "Update Current Student Is Success"
  		redirect_to root_path
  	else
  		flash.now[:danger] = "Unable To Update Your Current Student"
  		render :edit
  	end
  end
  
  def destroy
  	@student = Student.find(params[:id])
  	
  	@student.destroy
  	
  	redirect_to root_path
  end
  
  private
  
  def student_params
  	params.require(:student).permit(:student_name, :student_ic_number, :student_phone_number, :student_email)
  end
end
