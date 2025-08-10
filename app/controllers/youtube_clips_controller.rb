class YoutubeClipsController < ApplicationController
  before_action :set_youtube_clip, only: %i[ show edit update destroy ]

  # GET /youtube_clips or /youtube_clips.json
  def index
    @youtube_clips = YoutubeClip.all
  end

  # GET /youtube_clips/1 or /youtube_clips/1.json
  def show
  end

  # GET /youtube_clips/new
  def new
    @youtube_clip = YoutubeClip.new
  end

  # GET /youtube_clips/1/edit
  def edit
  end

  # POST /youtube_clips or /youtube_clips.json
  def create
    @youtube_clip = YoutubeClip.new(youtube_clip_params)

    respond_to do |format|
      if @youtube_clip.save
        format.html { redirect_to @youtube_clip, notice: "Youtube clip was successfully created." }
        format.json { render :show, status: :created, location: @youtube_clip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @youtube_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /youtube_clips/1 or /youtube_clips/1.json
  def update
    respond_to do |format|
      if @youtube_clip.update(youtube_clip_params)
        format.html { redirect_to @youtube_clip, notice: "Youtube clip was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @youtube_clip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @youtube_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtube_clips/1 or /youtube_clips/1.json
  def destroy
    @youtube_clip.destroy!

    respond_to do |format|
      format.html { redirect_to youtube_clips_path, notice: "Youtube clip was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_youtube_clip
      @youtube_clip = YoutubeClip.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def youtube_clip_params
      params.expect(youtube_clip: [ :title, :video_id, :description ])
    end
end
