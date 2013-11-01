class Material < ActiveRecord::Base

  has_many :cautelaitems, dependent: :restrict_with_exception

  before_validation :normalize_name, on: [:create, :update]

  validates_presence_of :codigo
  validates_presence_of :nome

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
