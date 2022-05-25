class HomeController < ApplicationController
    before_action :check_signed_in

    def check_signed_in
        redirect_to articles_path if signed_in?
    end

    def homepage
    end    
end
