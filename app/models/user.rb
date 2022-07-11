class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }# ここがユーザー本名全角かな、カナ、漢字の正規表現
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }# ここがユーザー本名全角かな、カナ、漢字の正規表現
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }# ここがユーザー本名全角カタカナの正規表現
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }# ここがユーザー本名全角カタカナの正規表現
  validates :nick_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }# ここがユーザー本名全角かな、カナ、漢字の正規表現
  validates :birthday, presence: true, format: {with: /\A\d{4}-\d{2}-\d{2}\z/ }# ここがユーザー誕生日の正規表現
  validates :email, presence: true, format: {with: /\A\S+@\S+\.\S+\z/ }# ここがメールアドレスに「＠」が必要な正規表現
  validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, length: { minimum: 6 } # ここが文字数の正規表現
end
