defmodule EventTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use Helper

  setup_all do
    :ok
  end

  test "all event" do
    use_cassette "#{module_name(__MODULE__)}/event/all" do
      assert {:ok, response} = Mangopay.Event.all()
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
