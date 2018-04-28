defmodule RefundTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use MangoPay.Factory
  use MangoPay.UserFactory
  use MangoPay.WalletFactory
  use MangoPay.CardFactory
  use MangoPay.BankAccountFactory
  use MangoPay.MandateFactory
  use MangoPay.PreauthorizationFactory
  use MangoPay.PayInFactory
  use MangoPay.TransferFactory
  use MangoPay.PayOutFactory
  use MangoPay.DisputeFactory
  use MangoPay.RepudiationFactory
  use MangoPay.RefundFactory
  use Helper

  setup_all do
    create_card_cassette()
    create_user_bis_cassette()
    create_bank_account_cassette()
    create_wallet_cassette()
    create_wallet_bis_cassette()
    create_pay_in_direct_cassette()
    create_pay_in_direct_bis_cassette()
    MangoPay.PayIn.Card.Direct.create(build(:pay_in_card_direct))
    create_transfer_cassette()
    create_transfer_bis_cassette()
    create_transfer_refund_cassette()
    create_pay_in_refund_cassette()
    create_pay_out_cassette()
    create_dispute_bis_cassette()
    get_repudiation_cassette()
    :ok
  end

  test "get refund" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/get" do
      assert {:ok, response} = MangoPay.Refund.get(build(:created_refund)["Id"])
      assert Poison.decode!(response.body)["Id"] == build(:created_refund)["Id"]
    end

    assert response = MangoPay.Refund.get!(build(:created_refund)["Id"])
    assert Poison.decode!(response.body)["Id"] == build(:created_refund)["Id"]
  end

  test "create refund in pay in direct" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/pay_in/create" do
      assert {:ok, response} =
               MangoPay.Refund.PayIn.create(build(:created_pay_in)["Id"], build(:refund_pay_in))

      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end

    assert response =
             MangoPay.Refund.PayIn.create!(
               build(:created_pay_in_bis)["Id"],
               build(:refund_pay_in)
             )

    assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
  end

  test "create refund transfer direct" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/transfer/create" do
      assert {:ok, response} =
               MangoPay.Refund.Transfer.create(
                 build(:created_transfer)["Id"],
                 build(:refund_transfer)
               )

      assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
    end

    assert response =
             MangoPay.Refund.Transfer.create!(
               build(:created_transfer_bis)["Id"],
               build(:refund_transfer)
             )

    assert Poison.decode!(response.body)["Status"] == "SUCCEEDED"
  end

  test "all refund by pay in" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/pay_in/all" do
      assert {:ok, response} = MangoPay.Refund.all_by_pay_in(build(:created_pay_in)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end

    assert response = MangoPay.Refund.all_by_pay_in!(build(:created_pay_in)["Id"])
    assert length(Poison.decode!(response.body)) > 0
  end

  test "all by pay_out" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/pay_out/all" do
      assert {:ok, response} = MangoPay.Refund.all_by_pay_out(created_pay_out()["Id"])
      assert length(Poison.decode!(response.body)) == 0
    end

    assert response = MangoPay.Refund.all_by_pay_out!(created_pay_out()["Id"])
    assert length(Poison.decode!(response.body)) == 0
  end

  test "all by transfer" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/transfer/all" do
      assert {:ok, response} = MangoPay.Refund.all_by_transfer(build(:created_transfer)["Id"])
      assert length(Poison.decode!(response.body)) > 0
    end

    assert response = MangoPay.Refund.all_by_transfer!(build(:created_transfer)["Id"])
    assert length(Poison.decode!(response.body)) > 0
  end

  test "all by repudiation" do
    use_cassette "#{Factories.SharedFunctions.module_name(__MODULE__)}/refund/repudiation/all" do
      assert {:ok, response} =
               MangoPay.Refund.all_by_repudiation(build(:created_repudiation)["Id"])

      assert length(Poison.decode!(response.body)) == 0
    end

    assert response = MangoPay.Refund.all_by_repudiation!(build(:created_repudiation)["Id"])
    assert length(Poison.decode!(response.body)) == 0
  end
end
