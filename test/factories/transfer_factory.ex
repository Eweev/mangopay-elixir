ExUnit.start()

defmodule MangoPay.TransferFactory do
  @moduledoc false
  defmacro __using__([]) do
    quote do
      def created_transfer_factory(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              ["", Factories.SharedFunctions.module_name(__MODULE__), "transfer", "create.json"],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def transfer_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_user)["Id"],
          CreditedUserId: build(:created_user)["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 499
          },
          Fees: %{
            Currency: "EUR",
            Amount: 2
          },
          DebitedWalletId: created_wallet()["Id"],
          CreditedWalletId: created_wallet_bis()["Id"]
        }
      end
    end
  end
end
