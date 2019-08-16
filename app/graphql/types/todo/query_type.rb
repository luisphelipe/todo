module Types
  module Todo
    class QueryType < Types::BaseObject
      # Add root-level fields here.
      # They will be entry points for queries on your schema.

      field :me, Types::Models::UserType, null:false 
      
      def me 
        context[:current_user]
      end
    end
  end
end
