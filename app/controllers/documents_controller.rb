class DocumentsController < ApplicationController

  def index
  end

  def show
    
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_parameters)
    if @document.save
      redirect_to @document
    else
      'render'
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
    def find_document
    end
    
    def document_parameters
      params.require(:document).permit(:title, :content)
    end
    
end
