defmodule MangoPay.Repudiation do
  @moduledoc """
  Functions for MangoPay [repudiation](https://docs.mangopay.com/endpoints/v2.01/repudiations#e221_the-repudiation-object).
  """
  use MangoPay.Query.Base
  set_action "repudiations", [{:get}]
end
