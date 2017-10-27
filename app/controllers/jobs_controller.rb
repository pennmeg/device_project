class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def est_cost
    puts "*** est_cost ***"
    respond_to do |format|
        format.js { render :est_cost }
    end
  end

  def check_status
    puts "*** check_status ***"
  end
  # GET /jobs
  # GET /jobs.json
  def index
    # @jobs = Job.all
    @jobs = if [:client_email]
      Job.where('client_email LIKE ?', "%#{params[:client_email]}%")
    else
      Job.all
    end

  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @users = User.all
    @jobs = Job.all
    @airports = Airport.all
    puts "@airports #{@airports.inspect}"
    @airplanes = Airplane.all
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  def check_status
    puts "==== check_status ======"

  end


  def search
    params.require(:job).permit(:client_email)

  end


  def create
    puts "******* create *******"
    puts "params: #{params.inspect}"
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else

        @users = User.all
        # @jobs = Job.all
        @airports = Airport.all
        puts "@airports #{@airports.inspect}"
        @airplanes = Airplane.all
        puts "@airplanes #{@airplanes.inspect}"

        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      # "origin_id"=>"1", "destination_id"=>"2", "client_name"=>"sd", "client_email"=>"sd@adgsdfg", "description"=>"sdgh", "weight"=>"1"}
      params.require(:job).permit(:origin_id, :destination_id, :client_name, :client_email, :description, :weight, :cost, :start_time, :end_time)
    end
end
