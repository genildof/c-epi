class CautelasController < ApplicationController
  before_action :set_cautela, only: [:print, :validate, :download, :show, :edit, :update, :destroy]
  before_action :set_employees_and_users, only: [:print, :new, :create, :edit, :update]
  before_action :set_materials, only: [:print, :show]

  # GET /cautelas
  # GET /cautelas.json
  def index
    @cautelas = Cautela.search(params[:search], params[:page])
    respond_to do |format|
      format.html
      #format.csv { send_data(@cautelas.to_csv) }
      format.csv {
        filename = "CEPI_Cautelas-#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"
        send_data(@cautelas.to_csv, :type => "text/csv; charset=utf-8; header=present", :filename => filename)
      }
    end
  end

  # GET /cautelas/1/validate
  def validate
  end

  # GET /cautelas/1/print
  def print
    render :template => 'cautelas/print', :layout => 'printing_layout'
  end

  # GET /cautelas/1
  # GET /cautelas/1.json
  def show
  end

  def download
    send_file @cautela.anexo, :type => 'application/pdf', :x_sendfile => true
  end

  # GET /cautelas/new
  def new
    @cautela = Cautela.new
  end

  # GET /cautelas/1/edit
  def edit
  end

  # POST /cautelas
  # POST /cautelas.json
  def create
    @cautela = Cautela.new(cautela_params)
    @cautela.user = current_user
    @cautela.data = Time.now
    respond_to do |format|
      if @cautela.save
        format.html { redirect_to @cautela, notice: 'Cautela criada com sucesso, adicione agora os materiais à lista.' }
        format.json { render action: 'additem', status: :created, location: @cautela }
      else
        format.html { render action: 'new' }
        format.json { render json: @cautela.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cautelas/1
  # PATCH/PUT /cautelas/1.json
  def update
    respond_to do |format|
      if @cautela.update(cautela_params)
        format.html { redirect_to @cautela, notice: 'Cautela atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cautela.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cautelas/1
  # DELETE /cautelas/1.json
  def destroy
    begin
      @cautela.destroy
      message = 'Exclusão efetuada com sucesso.'
      carrier = :notice
    rescue ActiveRecord::DeleteRestrictionError => e
      @cautela.errors.add(:base, e)
      puts @cautela.errors[:base].to_s
      carrier = :alert
      message = 'O registro possui referências em outra(s) tabela(s) e não pode ser excluído.'
        #message = 'A cautela possui itens associados e não pode ser excluída. #{@cautela.errors[:base].to_s}'
    ensure
      respond_to do |format|
        format.html { redirect_to cautelas_path, carrier => message }
        format.json { head :error }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cautela
    @cautela = Cautela.find(params[:id])
  end

  def set_employees_and_users
    @colaboradors = Colaborador.all
    @users = User.all
  end

  def set_materials
    @materials = Material.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cautela_params
    params.require(:cautela).permit(:colaborador_id, :user_id, :data, :status, :anexo, :comentarios)
  end

end
