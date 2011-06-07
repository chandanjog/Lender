class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.find_all
  end

  def show
    attachment = Attachment.load params[:file_name]
    send_data attachment.content, :filename => params[:file_name]
  end

  def create
    attachment = Attachment.new params['attachment'].original_filename, '', params['attachment'].read
    attachment.save
    redirect_to :action => :index
  end

  def destroy
    attachment = Attachment.new params[:file_name], ''
    attachment.delete
    redirect_to :action => :index
  end
end