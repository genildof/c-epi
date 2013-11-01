class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token


  has_secure_password validations: false

  belongs_to :cidade

  has_many :cautelas, dependent: :restrict_with_exception

  before_validation :normalize_name, on: [:create, :update]


  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates_presence_of :name
  validates :login, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates_presence_of :password_digest
  validates_presence_of :profile
  validates_presence_of :cidade
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX

  validates :login, :length => {:minimum => 8, :too_short => '%{count} characters is the minimum allowed'}

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  protected

  def normalize_name
    self.name = self.name.upcase
  end

  def self.search(search, page)
    order('name').
        where('name like ?', "%#{search}%").
        paginate(page: page, per_page: 10)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

  def password_digest=(digest)
    @password_digest = digest
  end

  def password_digest
    @password_digest
  end

end
