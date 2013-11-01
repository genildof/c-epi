class Colaborador < ActiveRecord::Base

  belongs_to :cargo
  belongs_to :cidade

  has_many :cautelas, dependent: :restrict_with_exception

  validates_presence_of :matricula
  validates_presence_of :nome
  validates_presence_of :cargo
  validates_presence_of :cidade
  validates_presence_of :admissao

  validates :matricula, length: {minimum: 3}, length: {maximum: 5}, numericality: {only_integer: true}, uniqueness: {message: 'Matrícula já cadastrada.'}
  validates :nome, length: {minimum: 10}

  before_validation :normalize_name, on: [:create, :update]

  protected

  def normalize_name
    self.nome = self.nome.upcase
  end

  def self.search(search, page)
    order('nome').
        where('nome like ?', "%#{search}%").
        paginate(page: page, per_page: 10)
  end

end
