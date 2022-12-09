class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 10}
  has_many :recruitments, through: :user_recruitments
  has_many :user_recruitments, dependent: :destroy
  has_many :chat_messages, dependent: :destroy
  validates :profile, length: { maximum: 200 }
  # アカウントを有効にする
  def activate
    update_columns(activated: FILL_IN, activated_at: FILL_IN)
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  private
  def downcase_email
    self.email = email.downcase
  end
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
