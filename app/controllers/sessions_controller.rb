class SessionsController < ApplicationController
	def create
	    user = User.find_by(email: params[:sessions][:email].downcase)
	    if user && user.authenticate(params[:sessions][:password])
	      sign_in user
	      #redirect_back_or user
	      #redirect_to user
	      redirect_to statics_home_path
	      # Sign the user in and redirect to the user's show page.
	    else
	      flash.now[:error] = 'Invalid email or password' # Not quite right!
	      render 'new'
	    end
    end

	def new
	end

	def destroy
	  sign_out
      redirect_to root_url
	end

end
