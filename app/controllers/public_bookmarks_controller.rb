class PublicBookmarksController < ApplicationController
  #before_action :set_public_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :set_public_bookmark, only: [:show, :destroy]
  http_basic_authenticate_with name: HTTP_BASIC_AUTH['name'], password: HTTP_BASIC_AUTH['password'], only: [:index_authenticated, :destroy]
  
  def index_authenticated
      @public_bookmarks = PublicBookmark.all
      @authenticated = true
      render :index
  end

  # GET /public_bookmarks
  # GET /public_bookmarks.json
  def index
    @public_bookmarks = PublicBookmark.all
  end

  # GET /public_bookmarks/1
  # GET /public_bookmarks/1.json
  def show
  end

  # GET /public_bookmarks/new
  def new
    @public_bookmark = PublicBookmark.new
  end

  # GET /public_bookmarks/1/edit
 # def edit
 # end

  # POST /public_bookmarks
  # POST /public_bookmarks.json
  def create
    @public_bookmark = PublicBookmark.new(public_bookmark_params)

    respond_to do |format|
      if @public_bookmark.save
        format.html { redirect_to @public_bookmark, notice: 'Public bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @public_bookmark }
      else
        format.html { render :new }
        format.json { render json: @public_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /public_bookmarks/1
  # PATCH/PUT /public_bookmarks/1.json
=begin
  def update
    respond_to do |format|
      if @public_bookmark.update(public_bookmark_params)
        format.html { redirect_to @public_bookmark, notice: 'Public bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @public_bookmark }
      else
        format.html { render :edit }
        format.json { render json: @public_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end
=end
  # DELETE /public_bookmarks/1
  # DELETE /public_bookmarks/1.json
  def destroy
    @public_bookmark.destroy
    respond_to do |format|
      format.html { redirect_to public_bookmarks_url, notice: 'Public bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_bookmark
      @public_bookmark = PublicBookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_bookmark_params
      params.require(:public_bookmark).permit(:title, :url, :description, :submitter_email)
    end
end
