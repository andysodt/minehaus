module Types
  class QueryType < Types::BaseObject

    field :allUsers, [UserType], null: false

    field :user, UserType, null: true
      argument :id, ID, required: true
    end

    def all_users
      User.all
    end

  end

end
