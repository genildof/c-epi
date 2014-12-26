class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_cidades, only: [:new, :create, :edit, :update]


  # flash possibilities: success, notice, alert, error

  # GET /users
  # GET /users.json
  def index
    @users = User.search(params[:search], params[:page])
  end

  def show
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
        format.html { redirect_to @user, success: 'Usuário criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, success: 'Usuário atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
      @user.destroy
      flash[:success] = 'Exclusão efetuada com sucesso.'
    rescue ActiveRecord::DeleteRestrictionError => e
      #print "An error occurred: ",$!, "\n"
      flash[:error] = 'O registro possui referências em outra(s) tabela(s) e não pode ser excluído.'
    ensure
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def set_cidades
    @cidades = Cidade.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :profile, :cidade_id)
  end

  # Before filters

  def correct_user
    @user = User.find(params[:id])
    if admin?
      true
    elsif !current_user?(@user)
      flash[:error] = 'Sem permissão para alteração de dados de outro usuário.'
      redirect_to(root_url)
    end
    #redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    if !admin?
      flash[:error] = 'Ação não autorizada para o usuário atual.'
      redirect_to(root_url)
    end
    #redirect_to(root_url) unless current_user.admin?
  end
end



