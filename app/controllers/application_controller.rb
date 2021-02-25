require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    erb :index
  end

  helpers do 
    
    def logged_in?
      !!current_user
    end
    
    def current_user 
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logout
      session.clear
    end
  end

end