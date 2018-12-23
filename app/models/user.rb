# frozen_string_literal: true

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

end
