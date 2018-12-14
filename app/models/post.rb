class Post < ApplicationRecord
	default_scope -> { order("created_at ASC") }
end
