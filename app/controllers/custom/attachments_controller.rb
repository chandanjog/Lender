module Custom
  class AttachmentsController < ApplicationController
    include Devise::Controllers::Helpers

    before_filter :valid_user?

    def index
      @attachments = Attachment.find_all
      render :layout => 'layout'
    end

    def show
      attachment = Attachment.load params[:file_name]
      send_data attachment.content, :filename => params[:file_name]
    end

    def create
      if params['attachment'].nil?
        flash[:error] = 'Please attach a file first.'
        redirect_to :action => :index
        return
      end

      attachment = Attachment.new params['attachment'].original_filename, '', params['attachment'].read
      if attachment.already_present?
        flash[:error] = 'File already present. Please delete the existing file and try again.'
      else
        attachment.save
      end
      redirect_to :action => :index
    end

    def destroy
      attachment = Attachment.new params[:file_name], ''
      attachment.delete
      redirect_to :action => :index
    end

    private
    def valid_user?
      redirect_to '/admin' unless signed_in?
    end

  end
end