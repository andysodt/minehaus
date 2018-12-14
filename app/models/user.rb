# frozen_string_literal: true

class User < ApplicationRecord
  default_scope -> { order('created_at ASC') }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
