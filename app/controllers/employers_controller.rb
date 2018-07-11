class EmployersController < ApplicationController
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)
    @employer.save

    binding.pry
    redirect_to employer_path(@employer)
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
