class PagesController < ApplicationController
    skip_before_action :authorize

def home
    redirect_to cafes_path if logged_in?
end



end
