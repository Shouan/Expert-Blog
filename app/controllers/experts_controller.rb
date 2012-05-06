class ExpertsController < ApplicationController
  before_filter :signed_in_expert, only: [:index, :edit, :update, :destroy]
  before_filter :correct_expert,   only: [:edit, :update]
  before_filter :admin_expert,     only: :destroy

  # GET /experts
  # GET /experts.json
  def index
    @experts = Expert.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experts }
    end
  end

  # GET /experts/1
  # GET /experts/1.json
  def show
    @expert = Expert.find(params[:id])
	@posts = @expert.posts.paginate(page: params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expert }
    end
  end

  # GET /experts/new
  # GET /experts/new.json
  def new
    @expert = Expert.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expert }
    end
  end

  # GET /experts/1/edit
  def edit
    @expert = Expert.find(params[:id])
  end

  # POST /experts
  # POST /experts.json
  def create
    @expert = Expert.new(params[:expert])

    respond_to do |format|
      if @expert.save
		sign_in @expert

        format.html { redirect_to @expert, notice: @expert.first_name + ' was successfully created.' }
        format.json { render json: @expert, status: :created, location: @expert }
      else
        format.html { render action: "new" }
        format.json { render json: @expert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experts/1
  # PUT /experts/1.json
  def update
    @expert = Expert.find(params[:id])

    respond_to do |format|
      if @expert.update_attributes(params[:expert])
	    flash[:success] = "Profile updated"
		sign_in @expert

        format.html { redirect_to @expert }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @expert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experts/1
  # DELETE /experts/1.json
  def destroy
    @expert = Expert.find(params[:id])
    @expert.destroy

    respond_to do |format|
	  flash[:success] = "User destroyed."
      format.html { redirect_to experts_url }
      format.json { head :ok }
    end
  end

  private



    def correct_expert
      @expert = Expert.find(params[:id])
      redirect_to(root_path) unless current_expert?(@expert)
    end

	def admin_expert
      redirect_to(root_path) unless current_expert.admin?
    end
end
