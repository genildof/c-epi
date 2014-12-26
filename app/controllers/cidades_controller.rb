class CidadesController < ApplicationController
  before_action :set_cidade, only: [:show, :edit, :update, :destroy]
  before_action :set_fabricas, only: [:new, :create, :edit, :update]

  # GET /cidades
  # GET /cidades.json
  def index
    #@cidades = Cidade.search(params[:search])
    @cidades = Cidade.search(params[:search], params[:page])
  end

  # GET /cidades/1
  # GET /cidades/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @task }
    end
  end

  # GET /cidades/new
  def new
    @cidade = Cidade.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @task }
    end
  end

  # GET /cidades/1/edit
  def edit
  end

  # POST /cidades
  # POST /cidades.json
  def create
    @cidade = Cidade.new(cidade_params)
    respond_to do |format|
      if @cidade.save
        format.html { redirect_to @cidade, notice: 'Cidade criada com sucesso.' }
        format.json { render action: 'show', status: :created, location: @cidade }
      else
        format.html { render action: 'new' }
        format.json { render json: @cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cidades/1
  # PATCH/PUT /cidades/1.json
  def update
    respond_to do |format|
      if @cidade.update(cidade_params)
        format.html { redirect_to @cidade, notice: 'Cidade atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cidades/1
  # DELETE /cidades/1.json
  def destroy
    begin
      @cidade.destroy
      message = 'Exclusão efetuada com sucesso.'
    rescue ActiveRecord::DeleteRestrictionError => e
      message = 'O registro possui referências em outra(s) tabela(s) e não pode ser excluído.'
    ensure
      respond_to do |format|
        format.html { redirect_to cidades_path, :notice => message }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cidade
    @cidade = Cidade.find(params[:id])
  end

  def set_fabricas
    @fabricas = Fabrica.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cidade_params
    params.require(:cidade).permit(:nome, :fabrica_id)
  end
end
