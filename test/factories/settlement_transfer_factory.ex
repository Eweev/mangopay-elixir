ExUnit.start()

defmodule MangoPay.SettlementTransferFactory do
  defmacro __using__([]) do
    quote do
      def created_settlement_transfer(module_name \\ nil) do
        Factories.SharedFunctions.get_json(
          Enum.join(
            Enum.filter(
              [
                "",
                Factories.SharedFunctions.module_name(__MODULE__),
                "settlement_transfer",
                "create.json"
              ],
              &(!is_nil(&1))
            ),
            "/"
          )
        )
      end

      def settlement_transfer_factory do
        %{
          Tag: "custom meta",
          AuthorId: build(:created_repudiation)["AuthorId"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 12
          },
          Fees: %{
            Currency: "EUR",
            Amount: 0
          }
        }
      end
    end
  end
end
