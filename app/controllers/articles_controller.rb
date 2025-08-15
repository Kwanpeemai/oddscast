class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show ]

  # GET /articles or /articles.json
  # def index
  #   @articles = Article.all
  # end
  def index
    # @articles = Article.order(created_at: :desc).limit(5)
    @articles = Article.published.order(created_at: :desc).limit(5)
    @highlight = @articles.first
    @other_articles = @articles.offset(1) # หรือ : offset/more logic flex

  case params[:status]
  when "draft"
    @draft_articles = Article.where(status: :draft)
    @waiting_articles = []
    @published_articles = []
  when "waiting"
    @draft_articles = []
    @waiting_articles = Article.where(status: :waiting)
    @published_articles = []
  when "published"
    @draft_articles = []
    @waiting_articles = []
    @published_articles = Article.where(status: :published)
  else # all
    @draft_articles = Article.where(status: :draft)
    @waiting_articles = Article.where(status: :waiting)
    @published_articles = Article.where(status: :published)

  end
  end
  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.published.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  # def create
  #   @article = Article.new(article_params)

  #   respond_to do |format|
  #     if @article.save
  #       format.html { redirect_to @article, notice: "Article was successfully created." }
  #       format.json { render :show, status: :created, location: @article }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @article.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /articles/1 or /articles/1.json
  # def update
  #   respond_to do |format|
  #     if @article.update(article_params)
  #       format.html { redirect_to @article, notice: "Article was successfully updated.", status: :see_other }
  #       format.json { render :show, status: :ok, location: @article }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @article.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /articles/1 or /articles/1.json
  # def destroy
  #   @article.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to articles_path, notice: "Article was successfully destroyed.", status: :see_other }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.expect(article: [ :title, :description ])
    end
end
