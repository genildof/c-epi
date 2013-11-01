class CautelaitemsController < ApplicationController
  before_action :set_cautelaitem, only: [:show, :edit, :update, :destroy]

  # GET /cautelaitems
  # GET /cautelaitems.json
  def index
    @cautelaitems = Cautelaitem.all
  end

  # GET /cautelaitems/1
  # GET /cautelaitems/1.json
  def show
  end

  # GET /cautelaitems/new
  def new
    @cautelaitem = Cautelaitem.new
  end

  # GET /cautelaitems/1/edit
  def edit
  end

  # POST /cautelaitems
  # POST /cautelaitems.json
  def create
    @cautela = Cautela.find(params[:cautela_id])
    @cautelaitem = @cautela.cautelaitems.create(cautelaitem_params)
    redirect_to cautela_path(@cautela)
  end

  # PATCH/PUT /cautelaitems/1
  # PATCH/PUT /cautelaitems/1.json
  def update
    respond_to do |format|
      if @cautelaitem.update(cautelaitem_params)
        format.html { redirect_to @cautelaitem, notice: 'Cautelaitem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cautelaitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cautelaitems/1
  # DELETE /cautelaitems/1.json
  def destroy
    @cautela = Cautela.find(params[:cautela_id])
    if @cautela.can_update?
      @cautelaitem = @cautela.cautelaitems.find(params[:id])
      @cautelaitem.destroy
      redirect_to cautela_path(@cautela)
    else
      respond_to do |format|
        format.html { redirect_to cautela_path(@cautela), notice: 'Ação não permitida, a cautela já foi validada.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cautelaitem
    @cautelaitem = Cautelaitem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cautelaitem_params
    params.require(:cautelaitem).permit(:material_id, :cautela_id, :serial, :validade, :quantidade)
  end
end
