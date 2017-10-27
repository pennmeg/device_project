class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]


	# // ======= select_job =======
  def select_user
    puts "\n******* select_user *******"
    @user = User.where(id:current_user[:id])
		@users = User.all
		puts "params: #{params.inspect}"
		puts "@user: #{@user.inspect}"
    respond_to do |format|
        format.js { render :select_user }
    end
  end


  def home
  	puts "/n******* home *******"
    puts "** current_user.inspect: #{current_user.inspect}"
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    puts "params: #{params.inspect}"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    puts "******* destroy *******"
    @user[:id].destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      puts "******* set_user *******"
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    puts "******* user_params *******"
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password)
  end

end
