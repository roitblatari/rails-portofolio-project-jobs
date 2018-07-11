class JobsController < ApplicationController
  # before_action :employer, only: [new]

  def new
    @employer = Employer.find_by(id: params[:employer_id])
    @job = Job.new
    # binding.pry
  end

  def create
    @employer = Employer.find_by(id: params[:employer_id])
  @job = Job.create(title: params[:job][:title], address: params[:job][:address], state: params[:job][:state])
  # binding.pry
  redirect_to job_path(@job)
  end



private

# def job_params
#   params.require(:job).permit( :employer_id, :title, :address, :state, :date)

# end
  # def employer
  #   @employer = Employer.find_by(id: params[:employer_id])
  # end

end
