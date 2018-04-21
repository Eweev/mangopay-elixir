defmodule MangoPay.UboDeclaration do
  use MangoPay.Query.Base
  set_action "ubodeclarations", [{:get}, {:update}, {:all}]

  def create_to_user(id, params) do
    _create params, ["users", id, "ubodeclarations"]
  end
end
