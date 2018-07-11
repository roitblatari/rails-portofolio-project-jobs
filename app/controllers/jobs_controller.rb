class JobsController < ApplicationController
  # before_action :employer, only: [new]

  def new
    @employer = Employer.find_by(id: params[:employer_id])
    @job = Job.new
    # binding.pry
  end

  def create
    @employer = Employer.find_by(id: params[:employer_id])
    @job = Job.new(title: params[:job][:title], address: params[:job][:address], state: params[:job][:state])
    @job.employer = @employer
    @job.save

  redirect_to employer_job_path(@employer, @job)
  end

def show
  # @employer = Employer.find_by(id: params[:employer_id])
  @job = Job.find_by(id: params[:id])
  binding.pry
end
private

# def job_params
#   params.require(:job).permit( :employer_id, :title, :address, :state, :date)

# end
  # def employer
  #   @employer = Employer.find_by(id: params[:employer_id])
  # end

end
