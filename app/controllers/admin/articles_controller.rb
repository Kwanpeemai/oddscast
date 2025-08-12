module Admin
  class Admin::ArticlesController < ApplicationController
    before_action :set_article, only: %i[ show edit update destroy ]

    # GET /admin/articles or /admin/articles.json
    def index
      @draft_articles = Article.draft.order(updated_at: :desc)
      @waiting_articles = Article.waiting_for_review.order(updated_at: :desc)
      @published_articles = Article.published.order(updated_at: :desc)
    end

    # GET /admin/articles/1 or /admin/articles/1.json
    def show
    end

    # GET /admin/articles/new
    def new
      @article = Article.new(content: Content.new)
    end

    # GET /admin/articles/1/edit
    def edit
    end

    # POST /admin/articles or /admin/articles.json
    def create
      @article = Article.new(article_params)

      respond_to do |format|
        if @article.save
          format.html { redirect_to [ :admin, @article ], notice: "Article was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/articles/1 or /admin/articles/1.json
    def update
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to [ :admin, @article ], notice: "Article was successfully updated.", status: :see_other }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/articles/1 or /admin/articles/1.json
    def destroy
      @article.destroy!

      respond_to do |format|
        format.html { redirect_to admin_articles_path, notice: "Article was successfully destroyed.", status: :see_other }
        format.json { head :no_content }
      end
    end

  def submit
    @article = Article.find(params[:id])
    @article.update(status: "waiting_for_review")
    redirect_to admin_articles_path(), notice: "Sent for review."
  end

  def waiting
    @article = Article.find(params[:id])
    render :waiting
  end

  def approve
    @article = Article.find(params[:id])
    @article.update(status: "published")
    redirect_to admin_article_path(@article), notice: "Article approved."
  end

  def reject
    @article = Article.find(params[:id])
    @article.update(status: "rejected")
    redirect_to admin_article_path(@article), notice: "Article rejected."
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def article_params
        params.require(:article).permit(:description, :cover_image, :status, content_attributes: [ :title ])
      end
  end
end
