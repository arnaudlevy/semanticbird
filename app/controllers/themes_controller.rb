class ThemesController < ApplicationController
  before_action :set_theme, only: %i[ show toggle edit update destroy ]

  add_breadcrumb 'Themes', :themes_path

  # GET /themes or /themes.json
  def index
    @themes = Theme.root
  end

  # GET /themes/1 or /themes/1.json
  def show
    @theme.ancestors_and_self.each do |t|
      add_breadcrumb t, t
    end
  end

  def toggle
    @lexem = params[:lexem]
    @theme.toggle @lexem
    @tweet = Tweet.find params[:tweet]
    @tweet.save
    render 'tweets/show.json'
  end

  # GET /themes/new
  def new
    @theme = Theme.new
  end

  # GET /themes/1/edit
  def edit
  end

  # POST /themes or /themes.json
  def create
    @theme = Theme.new(theme_params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: "Theme was successfully created." }
        format.json { render :show, status: :created, location: @theme }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /themes/1 or /themes/1.json
  def update
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to @theme, notice: "Theme was successfully updated." }
        format.json { render :show, status: :ok, location: @theme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /themes/1 or /themes/1.json
  def destroy
    @theme.destroy
    respond_to do |format|
      format.html { redirect_to themes_url, notice: "Theme was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def theme_params
      params.require(:theme).permit(:name, :parent_id, :color)
    end
end
