class ColaboradorsController < ApplicationController
  before_action :set_colaborador, only: [:show, :edit, :update, :destroy]
  before_action :set_cargos_cidades, only: [:new, :create, :edit, :update]

  # GET /colaboradors
  # GET /colaboradors.json
  def index
    @colaboradors = Colaborador.search(params[:search], params[:page])
  end

  # GET /colaboradors/1
  # GET /colaboradors/1.json
  def show
  end

  # GET /colaboradors/new
  def new
    @colaborador = Colaborador.new
  end

  # GET /colaboradors/1/edit
  def edit
  end

  # POST /colaboradors
  # POST /colaboradors.json
  def create
    @colaborador = Colaborador.new(colaborador_params)
    respond_to do |format|
      if @colaborador.save
        format.html { redirect_to @colaborador, notice: 'Colaborador was successfully created.' }
        format.json { render action: 'show', status: :created, location: @colaborador }
      else
        format.html { render action: 'new' }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colaboradors/1
  # PATCH/PUT /colaboradors/1.json
  def update
    respond_to do |format|
      if @colaborador.update(colaborador_params)
        format.html { redirect_to @colaborador, notice: 'Colaborador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaboradors/1
  # DELETE /colaboradors/1.json
  def destroy
    begin
      @colaborador.destroy
      message = 'Exclusão efetuada com sucesso.'
    rescue ActiveRecord::DeleteRestrictionError => e
      message = 'O registro possui referências em outra(s) tabela(s) e não pode ser excluído.'
    ensure
      respond_to do |format|
        format.html { redirect_to colaboradors_path, :notice => message }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_colaborador
    @colaborador = Colaborador.find(params[:id])
  end

  def set_cargos_cidades
    @cargos = Cargo.all
    @cidades = Cidade.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def colaborador_params
    params.require(:colaborador).permit(:matricula, :nome, :cargo_id, :cidade_id, :admissao, :desligado)
  end
end
