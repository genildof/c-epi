class Cidade < ActiveRecord::Base

  belongs_to :fabrica
  has_many :colaboradors, dependent: :restrict_with_exception

  before_validation :normalize_name, on: [:create, :update]

  validates_presence_of :nome
  validates_presence_of :fabrica

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
