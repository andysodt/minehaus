class Types::UserType < Types::BaseObject
	graphql_name 'User'
	field :id, ID, null: false
	field :email, String, null: false
end