class ApplicationController < Sinatra::Base   


  configure do    
      set :views, 'app/views'
      set :public_folder, 'public'
      enable :sessions
      register Sinatra::Flash

  end


  get '/' do
      erb :root
  end

  get '/home' do   
      authorize 
      erb :home
  end

  get '/sign_out' do     
      session.clear 
      redirect '/'
  end

  helpers do 

      def signed_in?   
          !!User.find_by(id: session[:user_id])
      end

      def current_user
          user = User.find_by(id: session[:user_id])
     #     raise AuthenticationError.new if user.nil?
          user
      end

      def authenticate(username, password)
          user = User.find_by(username: username)
      #    raise AuthenticationError.new unless !!user
      #    raise AuthenticationError.new if !user.authenticate(password)
          session[:user_id] = user.id
          user
      end

      def authorize
          current_user
      end

 #     def authorize_user(run)
 #         raise NoResourceError.new if !friend
 #         raise AuthorizationError.new if friend.user != current_user
  #    end

  #    def sign_in_error_messages(errors)
  #        if errors
  #            erb :'sessions/_errors', locals: {errors: errors}
  #        end
  #    end

      def your_friend?(friend)
          current_user == friend.user
      end

  end


#  error AuthenticationError do
# #     status AuthenticationError.status
 #     erb :error, locals: {msg: AuthenticationError.msg, links: AuthenticationError.links }, layout: false
#  end

 # error AuthorizationError do 
 #     status AuthorizationError.status
 #     erb :error, locals: {msg: AuthorizationError.msg, links: AuthorizationError.links }, layout: false
 # end

 # error NoResourceError do
 #     status NoResourceError.status
 #     erb :error, locals: {msg: NoResourceError.msg , links: NoResourceError.links }, layout: false
#  end

 # error PostSiteError do
 #     status PostSiteError.status
 #     erb :error, locals: {msg: PostSiteError.msg , links: PostSiteError.links }, layout: false
 # end
end