class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destory] #runs first; find doc for specific actions

  def index
    @docs = Doc1.all.order("created_at DESC") #order by creation time (descending)
  end

  def show
  end

  def new
    @doc = Doc.new #instance of a new document
  end

  def create
    @doc = Doc.new(doc_params) #title and content (in this case)

    if @doc.save
      redirect_to @doc #redirect to document itself
    else
      render 'new' #failed to do it the first time, do it again
    end
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

    def find_doc
      @doc = Doc.find(params[:id]) #need to find document to show and delete; fetch using id number
    end

    def doc_params #doc attributes from model
      params.require(:doc).permit(:title, :content)
    end

end
