class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy] #runs first; find doc for specific actions

  def index
    @docs = Doc.all.order("created_at DESC") #order by creation time (descending)
  end

  def show #taken care of in before_action
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

  def edit #view file (taken care of in before_action)
  end

  def update #fetches the doc and change parameters
    if @doc.update(doc_params) #if updated, save changes
      redirect_to @doc #then go back to doc
    else
      render 'edit' #render edit page
    end
  end

  def destroy
    @doc.destroy #delete it
    redirect_to docs_path #back to index page
  end

  private

    def find_doc
      @doc = Doc.find(params[:id]) #need to find document to show and delete; fetch using id number
    end

    def doc_params #doc attributes from model
      params.require(:doc).permit(:title, :content)
    end

end
