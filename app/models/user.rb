# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enumerize :role, in: %i[default admin], default: :default

  has_many :ads, dependent: :destroy

  validates :nickname, :email, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end

  def admin?
    role == 'admin'
  end
end
