defmodule MandateTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use UserHelper
  use BankAccountHelper
  use MandateHelper

  setup_all do
    create_mandate_cassette()
    :ok
  end

  test "create mandate" do
    use_cassette "#{module_name(__MODULE__)}/mandate/create" do
      assert {:ok, response} = Mangopay.Mandate.create mandate_hash()
      assert Poison.decode!(response.body)["Status"] == "CREATED"
      assert Poison.decode!(response.body)["UserId"] == created_user()["Id"]
    end
  end

  test "cancel mandate" do
    use_cassette "#{module_name(__MODULE__)}/mandate/cancel" do
      assert  {:ok, response} = Mangopay.Mandate.cancel created_user()["Id"], update_mandate_hash()
      assert Poison.decode!(response.body)["Tag"] == cancel_mandate_hash()["Tag"]
    end
  end

  test "get user" do
    use_cassette "#{module_name(__MODULE__)}/mandate/get" do
      assert {:ok, response} = Mangopay.Mandate.get created_mandate()["Id"]
      assert Poison.decode!(response.body)["Id"] == created_mandate()["Id"]
    end
  end

  test "all mandate" do
    use_cassette "#{module_name(__MODULE__)}/mandate/all" do
      assert {:ok, response} = Mangopay.Mandate.all
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all mandate by user" do
    use_cassette "#{module_name(__MODULE__)}/mandate/user/all" do
      Mangopay.Mandate.create mandate_hash()
      assert {:ok, response} = Mangopay.Mandate.all_by_user created_user()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end

  test "all mandate by user and bank_account" do
    use_cassette "#{module_name(__MODULE__)}/mandate/user/bank_account/all" do
      assert {:ok, response} = Mangopay.Mandate.all_by_user_and_bank_account created_user()["Id"], created_bank_account()["Id"]
      assert length(Poison.decode!(response.body)) > 0
    end
  end
end
