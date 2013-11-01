class Cautela < ActiveRecord::Base

  belongs_to :colaborador
  belongs_to :user

  has_many :cautelaitems, dependent: :restrict_with_exception

  validates_presence_of :colaborador
  validates_presence_of :user
  validates_presence_of :data
  validates_presence_of :status

  mount_uploader :anexo, CautelaUploader

  accepts_nested_attributes_for :cautelaitems, :allow_destroy => true, :reject_if => lambda { |a| a[:quantidade].blank? }


  protected

  # Index page search function
  def self.search(search, page)
    order('data').includes(:colaborador).
        where('colaboradors.nome like ?', "%#{search}%").
        references(:colaborador).
        paginate(page: page, per_page: 10)
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |cautela|
        csv << cautela.attributes.values_at(*column_names)
      end
    end
  end

  public

  # Some rules for view controls visibility

  # Cautela has child items
  def has_itens?
    !self.cautelaitems.empty?
  end

  # Cautela has a digital signed version of the document
  def is_valid?
    !self.anexo.blank?
  end

  # Only not validated can be updated and receive new itens
  def can_update?
    !self.is_valid?
  end

  # Only if not valid and must have at least one item
  def can_validate?
    !self.is_valid? && self.has_itens?
  end

end
