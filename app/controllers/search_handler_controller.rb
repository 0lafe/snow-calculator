class SearchHandlerController < ApplicationController

    def index  
        if Zipcode.find_by(zipcode: params[:query])
            redirect_to zipcode_path(id: Zipcode.find_by(zipcode: params[:query]))
        else
            flash[:notification]="Zipcode isn't stored.... yet!"
            redirect_to root_path
        end
    end

end