# frozen_string_literal: true

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy

  has_one_attached :avatar

  validates :first_name, :last_name, presence: true

  def full_name
    [first_name, last_name].join(" ")
  end

end
