defmodule Mangopay.ClientFactory do
  defmacro __using__(opts \\ nil) do
    quote do
      require Factories.SharedFunctions
      Factories.SharedFunctions.set

      def created_client(module_name \\ nil) do
        get_json(
          Enum.join(
            Enum.filter(["", module_name(__MODULE__), "client", "get.json"], &(!is_nil(&1))),
            "/"
          )
        )
      end

      def update_client_hash do
        %{
          PlatformDescription:
            "We are a marketplace specialised in rare flipflops for Europe and America. "
        }
      end

      def update_logo_client_hash do
        %{
          File:
            "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAEBAQEBAQEBAQEBAQECAgMCAgICAgQDAwIDBQQFBQUE BAQFBgcGBQUHBgQEBgkGBwgICAgIBQYJCgkICgcICAj/2wBDAQEBAQICAgQCAgQIBQQFCAgICAgI CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj/wgARCAAyADIDAREA AhEBAxEB/8QAGwAAAgMBAQEA"
        }
      end

      def all_client_wallet do
        use_cassette "#{module_name(__MODULE__)}/client_wallet/all" do
          Mangopay.ClientWallet.all()
        end
      end

      def get_client_cassette do
        use_cassette "#{module_name(__MODULE__)}/client/get" do
          Mangopay.Client.get()
        end
      end
    end
  end
end
