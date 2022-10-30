class TransaktionsController < ApplicationController
  before_action :set_transaktion, only: %i[show edit update destroy]

  # GET /transaktions or /transaktions.json
  def index
    @transaktions = Transaktion.includes(:category).where(category_id: params[:category_id]).order(created_at: :desc)
  end

  # GET /transaktions/1 or /transaktions/1.json
  def show; end

  # GET /transaktions/new
  def new
    @transaktion = Transaktion.new
  end

  # GET /transaktions/1/edit
  def edit; end

  # POST /transaktions or /transaktions.json
  def create
    @transaktion = Transaktion.new(transaktion_params)
    @transaktion.user_id = current_user.id
    @transaktion.category_id = params[:category_id]

    respond_to do |format|
      if @transaktion.save
        format.html do
          redirect_to category_transaktion_path(id: @transaktion.id), notice: 'Transaktion was successfully created.'
        end
        format.json { render :show, status: :created, location: @transaktion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaktion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaktions/1 or /transaktions/1.json
  def update
    respond_to do |format|
      if @transaktion.update(transaktion_params)
        format.html { redirect_to transaktion_url(@transaktion), notice: 'Transaktion was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaktion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaktion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaktions/1 or /transaktions/1.json
  def destroy
    @transaktion.destroy

    respond_to do |format|
      format.html { redirect_to transaktions_url, notice: 'Transaktion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaktion
    @transaktion = Transaktion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaktion_params
    params.require(:transaktion).permit(:name, :amount)
  end
end
