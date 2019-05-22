defmodule MangoPay.BankingAlias do
  @moduledoc """
  Functions for MangoPay [BankingAlias](https://docs.mangopay.com/endpoints/v2.01/banking-aliases#e849_the-banking-alias-object).
  """
  use MangoPay.Query.Base
  set_path "bankingaliases"

  @doc """
  Get a banking alias.

  ## Examples
      {:ok, banking_alias} = MangoPay.BankingAlias.get(id)

  """
  def get id do
    _get id
  end

  @doc """
  Get a banking alias.

  ## Examples
      banking_alias = MangoPay.BankingAlias.get!(id)

  """
  def get! id do
    _get! id
  end

  @doc """
  Create a BankingAlias.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "CreditedUserId": "8494514",
        "OwnerName": "Joe Blogs",
        "Country": "FR"
      }
      {:ok, banking_alias} = MangoPay.BankingAlias.create(params)

  """
  def create wallet_id, params do
    _create params, [MangoPay.Wallet.path(wallet_id), MangoPay.BankingAlias.path("iban")] 
  end

  @doc """
  Create a banking alias.

  ## Examples
      params         = %{
        "Tag": "custom meta",
        "CreditedUserId": "8494514",
        "OwnerName": "Joe Blogs",
        "Country": "FR"
      }
      banking_alias = MangoPay.BankingAlias.create!(params)

  """
  def create! wallet_id, params do
    _create! params, [MangoPay.Wallet.path(wallet_id), MangoPay.BankingAlias.path("iban")] 
  end

  @doc """
  Update a banking alias.

  ## Examples
      params         = %{
        "Active": false
      }
      {:ok, banking_alias} = MangoPay.BankingAlias.update(id, params)

  """
  def update id, params do
    _update params, id
  end

  @doc """
  Update a banking alias.

  ## Examples
      params         = %{
        "Active": false
      }
      banking_alias = MangoPay.BankingAlias.update!(id, params)

  """
  def update! id, params do
    _update! params, id
  end


  @doc """
  List all banking aliases by wallet.

  ## Examples

      wallet_id = Id of a wallet
      query   = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821
      }
      {:ok, banking_alias} = MangoPay.BankingAlias.all_by_wallet!(wallet_id, query)

  """
  def all_by_wallet id, query \\ %{} do
    _all [MangoPay.Wallet.path(id), MangoPay.BankingAlias.path()], query
  end

  @doc """
  List all banking aliases by wallet.

  ## Examples
      wallet_id = Id of a wallet
      query   = %{
        "Page": 1,
        "Per_Page": 25,
        "Sort": "CreationDate:DESC",
        "BeforeDate": 1463440221,
        "AfterDate": 1431817821
      }
      banking_alias = MangoPay.BankingAlias.all_by_wallet!(wallet_id, query)

  """
  def all_by_wallet! id, query \\ %{} do
    _all! [MangoPay.Wallet.path(id), MangoPay.BankingAlias.path()], query
  end
end
