class SnowLogController < ApplicationController

    def new
        @zipcode = Zipcode.find(params[:zipcode_id])
        @new_log = SnowLog.new()
        render :new
    end

    def create
        @new_log = SnowLog.new(inches: params[:snow_log][:inches], zipcode_id: params[:zipcode_id])
        if @new_log.save
            flash[:notification]="Log successfully saved"
            redirect_to root_path
        else
            flash.now[:error]=@new_log.errors.full_messages.to_sentence
            render :new
        end
    end

end