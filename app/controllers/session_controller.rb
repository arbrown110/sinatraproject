class SessionController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do    
        if
            authenticate(params[:username], params[:password])
            redirect '/home'
        else AuthenticationError         
            @errors = ["Improper information entered"]
            erb :'sessions/login'
        end
    end

    get '/signup' do
        erb :'sessions/signup'
    end

end