class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :email
    # 全角ひらがな、カタカナ、漢字で入力させるオプション
    validates :last_name, :first_name,
              format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
    validates :last_name_kana, :first_name_kana,
              format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :birth_day, presence: true
  end
  # 英数字を入力させるオプション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
