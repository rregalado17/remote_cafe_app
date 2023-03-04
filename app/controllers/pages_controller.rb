class PagesController < ApplicationController
    skip_before_action :authorize

def home
    "hi"
end



end
