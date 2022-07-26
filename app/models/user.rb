class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  with_options presence: true do
    validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は全角で入力してください" } # ここがユーザー本名全角かな、カナ、漢字の正規表現
    validates :last_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は全角で入力してください" } # ここがユーザー本名全角かな、カナ、漢字の正規表現
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カナで入力してください" } # ここがユーザー本名全角カタカナの正規表現
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カナで入力してください" } # ここがユーザー本名全角カタカナの正規表現
    validates :nick_name
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数を両方含む必要があります" } # ここが文字数の正規表現
  end
end