class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  has_many :bookmarks, dependent: :destroy
  
  self.per_page = 5

	

	validates :name, presence: true, length: { maximum: 30 }

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, 
              presence: true, 
              format: { with: EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
    
    validates :password, length: { minimum: 4 }
    has_secure_password

  def feed
    Bookmark.where("user_id = ?", id)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
	
end
