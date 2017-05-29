class DocumentsController < ApplicationController

  before_action :set_document, only: [:show, :edit, :update, :destroy]  

  def index
    @documents = Document.all.order("created_at DESC")
  end

  def show
  end

  def new
    @document = Document.new 
  end

  def create
    @document = current_user.documents.build(document_parameters)
    
    if @document.save
      redirect_to @document
    else
      'render'
    end
  end
  
  def edit
  end

  def update
    if @document.update(document_parameters)
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path
  end
  
  private
  
    def set_document
      @document = Document.find(params[:id])
    end
    
    def document_parameters
      params.require(:document).permit(:title, :content)
    end
    
end
