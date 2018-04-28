defmodule ClientTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.ClientFactory
  use Helper

  test "get client" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/client/get" do
      assert {:ok, response} = MangoPay.Client.get()
      assert Poison.decode!(response.body)["ClientId"] == "sdk-unit-tests"
    end
    assert response = MangoPay.Client.get!()
    assert Poison.decode!(response.body)["ClientId"] == "sdk-unit-tests"
  end

  test "update client" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/client/update" do
      assert {:ok, response} = MangoPay.Client.update(update_client_hash())
      assert Poison.decode!(response.body)["ClientId"] == "sdk-unit-tests"
    end
    assert response = MangoPay.Client.update!(update_client_hash())
    assert Poison.decode!(response.body)["ClientId"] == "sdk-unit-tests"
  end

  test "update_logo client iban" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/client/logo/update" do
      assert {:ok, response} = MangoPay.Client.update_logo(update_logo_client_hash())
      assert Poison.decode!(response.body)["ClientId"] == "sdk-unit-tests"
    end
    assert response = MangoPay.Client.update_logo!(update_logo_client_hash())
    assert Poison.decode!(response.body)["ClientId"] == "sdk-unit-tests"
  end
end
