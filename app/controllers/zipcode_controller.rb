class ZipcodeController < ApplicationController

    def index
        @zipcodes = Zipcode.all.sort {|a,b| b.highest_snowfall <=> a.highest_snowfall}
        render :index
    end

    def show
        @zipcode = Zipcode.find(params[:id])
        render :show
    end

    def new
        @new_zipcode = Zipcode.new()
    end

    def create
        @new_zipcode = Zipcode.new(zipcode: params[:zipcode][:zipcode])
        if @new_zipcode.save
            flash[:notification]="Zipcode successfully Added!"
            redirect_to root_path
        else
            flash.now[:error]=@new_zipcode.errors.full_messages.to_sentence
            render :new
        end
    end

end