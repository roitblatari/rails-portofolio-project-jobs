class SessionController < ApplicationController
  def new
  # binding.pry
  end

  def create
    if params[:provider] == 'github'
      #create or find user with github emaila and log them in
  
      @employer = Employer.find_or_create_by(email: auth['info']['email'])  do |u|

        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex


      end
      # binding.pry

      session[:employer_id] = @employer.id
      redirect_to employer_path(@employer)
      #
      # # render 'welcome/home'
    end
    # binding.pry
  end

  def destroy
  end

private
  def auth
    request.env['omniauth.auth']
  end
end
