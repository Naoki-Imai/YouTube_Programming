class ApplicationController < ActionController::Base
    before_action :set_search
    before_action :configure_permitted_parameters, if: :devise_controller?

    def authenticate_user
        if @current_user == nil
            redirect_to root_path
        end
    end

    def index_current_user
        if @current_user != nil
            redirect_to movie_path
        end
        
    end
    def after_sign_in_path_for(resource)
        movies_path
    end
    def after_sign_up_path_for(resource)
        movies_path
    end

    def set_search
        @search = Movie.ransack(params[:q])
        @search_movies = @search.result
    end

    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
