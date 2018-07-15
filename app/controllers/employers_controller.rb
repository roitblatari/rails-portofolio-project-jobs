class EmployersController < ApplicationController
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      session[:employer_id] = @employer.id 
      redirect_to employer_path(@employer)
    else 
      redirect_to root_path
    end
  end

  def show
    # binding.pry
  @employer = Employer.find_by(id: params[:id])
  end


  private
    def employer_params
      params.require(:employer).permit(:name, :uid , :email, :password)
    end

end



# name
# uid
# email
