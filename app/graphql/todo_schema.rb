class TodoSchema < GraphQL::Schema
  mutation(Types::Todo::MutationType)
  query(Types::Todo::QueryType)
end
