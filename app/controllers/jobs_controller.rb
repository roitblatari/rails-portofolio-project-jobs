class JobsController < ApplicationController
  # before_action :employer, only: [new]

  def new
    @employer = Employer.find_by(id: params[:employer_id])
    binding.pry
    @job = @employer.jobs.new
    # binding.pry
  end

private


  # def employer
  #   @employer = Employer.find_by(id: params[:employer_id])
  # end

end
