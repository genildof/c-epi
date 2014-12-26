class CargosController < ApplicationController
  before_action :set_cargo, only: [:show, :edit, :update, :destroy]

  # GET /cargos
  # GET /cargos.json
  def index
    @cargos = Cargo.search(params[:search], params[:page])
  end

  # GET /cargos/1
  # GET /cargos/1.json
  def show
  end

  # GET /cargos/new
  def new
    @cargo = Cargo.new
  end

  # GET /cargos/1/edit
  def edit
  end

  # POST /cargos
  # POST /cargos.json
  def create
    @cargo = Cargo.new(cargo_params)

    respond_to do |format|
      if @cargo.save
        format.html { redirect_to @cargo, notice: 'Cargo criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @cargo }
      else
        format.html { render action: 'new' }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cargos/1
  # PATCH/PUT /cargos/1.json
  def update
    respond_to do |format|
      if @cargo.update(cargo_params)
        format.html { redirect_to @cargo, notice: 'Cargo atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cargos/1
  # DELETE /cargos/1.json
  def destroy
    begin
      @cargo.destroy
      message = 'Exclusão efetuada com sucesso.'
    rescue ActiveRecord::DeleteRestrictionError => e
      message = 'O registro possui referências em outra(s) tabela(s) e não pode ser excluído.'
    ensure
      respond_to do |format|
        format.html { redirect_to cargos_path, :notice => message }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cargo
    @cargo = Cargo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cargo_params
    params.require(:cargo).permit(:nome, :periculosidade)
  end
end
