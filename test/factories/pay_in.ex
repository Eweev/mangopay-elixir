defmodule Mangopay.PayInFactory do
  defmacro __using__(_opts) do
    quote do
      def pay_in_card_web_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          CreditedUserId: created_user()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          ReturnURL: "http://www.my-site.com/returnURL/",
          CreditedWalletId: created_wallet(__MODULE__)["Id"],
          CardType: "CB_VISA_MASTERCARD",
          SecureMode: "DEFAULT",
          Culture: "EN",
          TemplateURLOptions: %{
            Payline: "https://www.mysite.com/template/"
          },
          StatementDescriptor: "Mar2016"
        }
      end

      def pay_in_card_direct_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          CreditedWalletId: created_wallet(__MODULE__)["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          SecureModeReturnURL: "http://www.my-site.com/returnURL",
          CardId: created_card(__MODULE__)["Id"],
          SecureMode: "DEFAULT",
          Billing: %{
            Address: %{
              AddressLine1: "1 Mangopay Street",
              AddressLine2: "The Loop",
              City: "Paris",
              Region: "Ile de France",
              PostalCode: "755001",
              Country: "FR"
            }
          },
          StatementDescriptor: "Mar2016"
        }
      end

      def pay_in_card_preauthorized_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          CreditedWalletId: created_wallet(__MODULE__)["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          PreauthorizationId: created_preauthorization(__MODULE__)["Id"]
        }
      end

      def pay_in_bank_wire_direct_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          CreditedWalletId: created_wallet()["Id"],
          DeclaredDebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          DeclaredFees: %{
            Currency: "EUR",
            Amount: 3
          }
        }
      end

      def pay_in_bank_wire_wallet_hash do
        %{
          Tag: "custom meta",
          CreditedWalletId: "CREDIT_EUR",
          DeclaredDebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          DeclaredFees: %{
            Currency: "EUR",
            Amount: 3
          }
        }
      end

      def pay_in_directdebit_web_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          ReturnURL: "http://www.my-site.com/returnURL/",
          CreditedWalletId: created_wallet()["Id"],
          DirectDebitType: "SOFORT",
          SecureMode: "DEFAULT",
          Culture: "EN",
          TemplateURLOptions: %{
            Payline: "https://www.mysite.com/template/"
          }
        }
      end

      def pay_in_directdebit_direct_hash do
        %{
          Tag: "custom meta",
          AuthorId: created_user()["Id"],
          CreditedWalletId: created_wallet()["Id"],
          DebitedFunds: %{
            Currency: "EUR",
            Amount: 550
          },
          Fees: %{
            Currency: "EUR",
            Amount: 3
          },
          MandateId: created_mandate()["Id"],
          StatementDescriptor: "Nov2016"
        }
      end

    end
  end
end
