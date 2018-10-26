require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password"
  end

  get '/' do
    erb :'/homepage'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      user.find_by(session[:user_id])
    end
  end

end
