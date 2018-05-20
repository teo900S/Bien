class SessionsController < ApplicationController

  def new
    #login form
  end

  def create
    # actually try and log in
    # note: update from video from require to permit

    # https://stackoverflow.com/questions/30825735/param-is-missing-or-the-value-is-empty-parametermissing-in-resultscontrollerup
    # changed back to require, with permit log out info was not showing up.
    @form_data = params.require(:session)

    # pull out username and paswword
    @username = @form_data[:username]
    @password = @form_data[:password]

    # lets check the user credentials
    @user = User.find_by(username: @username).try(:authenticate, @password)

    # if there is a user present
      if @user
        # save the user to that user's session
        session[:user_id] = @user.id



          redirect_to root_path
        # then
      else
          render "new"
      end

  end

  def destroy
    #log user out
    # remove the session completly
    reset_session

    # redirect to sign log in page
    redirect_to new_session_path
  end

end
