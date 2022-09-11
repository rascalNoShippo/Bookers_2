class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  has_one_attached :prof_image
  
  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  def get_prof_image(width, heght)
    unless prof_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      prof_image.attach(io: File.open(file_path), filename: 'default.jpg', content_type: 'image/jpeg')
    end
    prof_image.variant(resize_to_limit: [width, heght]).processed
  end


end
