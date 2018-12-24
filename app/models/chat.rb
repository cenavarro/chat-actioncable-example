# frozen_string_literal: true

class Chat < ApplicationRecord

  has_many :messages

  validates :name, presence: true

end
