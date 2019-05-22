defmodule MangoPay.UboDeclaration do
  @moduledoc """
  Functions for MangoPay [ubo declaration](https://docs.mangopay.com/endpoints/v2.01/ubo-declarations#e918_the-ubo-declaration-object).
  """
  use MangoPay.Query.Base
  set_path "kyc/ubodeclarations"

  @doc """
  Get a ubo declaration.

  ## Examples
      {:ok, ubo_declaration} = MangoPay.UboDeclaration.get(user_id, ubo_declaration_id)

  """
  def get user_id, ubo_declaration_id do
    _get user_resource(user_id, ubo_declaration_id)
  end

  @doc """
  Get a ubo declaration.

  ## Examples
      ubo_declaration = MangoPay.UboDeclaration.get!(user_id, ubo_declaration_id)

  """
  def get! user_id, ubo_declaration_id do
    _get! user_resource(user_id, ubo_declaration_id)
  end

  @doc """
  Get a ubo.

  ## Examples
      {:ok, ubo} = MangoPay.UboDeclaration.get(user_id, ubo_declaration_id, ubo_id)

  """
  def get user_id, ubo_declaration_id, ubo_id do
    _get user_resource(user_id, ubo_declaration_id) ++ ["ubos", ubo_id]
  end

  @doc """
  Get a ubo declaration.

  ## Examples
      ubo = MangoPay.UboDeclaration.get!(user_id, ubo_declaration_id, ubo_id)

  """
  def get! user_id, ubo_declaration_id, ubo_id do
    _get! user_resource(user_id, ubo_declaration_id) ++ ["ubos", ubo_id]
  end

  @doc """
  List ubo declarations for a user.

  ## Examples
      {:ok, user_ubo_declarations} = MangoPay.UboDeclaration.list_user_declaration(user_id)

  """
  def list_user_declaration user_id do
    _get [MangoPay.User.path(user_id), resource()]
  end

  @doc """
  List ubo declarations for a user.

  ## Examples
      user_ubo_declarations = MangoPay.UboDeclaration.list_user_declaration!(user_id)

  """
  def list_user_declaration! user_id do
    _get! [MangoPay.User.path(user_id), resource()]
  end

  

  @doc """
  Create a ubo declaration.

  """
  def create user_id do
    _create %{}, [MangoPay.User.path(user_id), resource()]
  end

  @doc """
  Create a ubo declaration.

  """
  def create! user_id do
    _create! %{}, [MangoPay.User.path(user_id), resource()]
  end

  @doc """
  Create a ubo.

  ## Examples
      params                 = %{
        "FirstName": "Bob",
        "LastName": "Snow",
        "Address": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "Nationality": "BE",
        "Birthday": 1463496101,
        "Birthplace": %{
          "City": "Namur",
          "Country": "BE"
        }
      }
      {:ok, ubo_declaration} = MangoPay.UboDeclaration.create("ubo_declaration_id", params)

  """
  def create user_id, ubo_declaration_id, params do
    _create params, user_resource(user_id, ubo_declaration_id) ++ ["ubos"]
  end

  @doc """
  Create a ubo.

  ## Examples
      params                 = %{
        "FirstName": "Bob",
        "LastName": "Snow",
        "Address": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "Nationality": "BE",
        "Birthday": 1463496101,
        "Birthplace": %{
          "City": "Namur",
          "Country": "BE"
        }
      }
      ubo_declaration = MangoPay.UboDeclaration.create!("ubo_declaration_id", params)

  """
  def create! user_id, ubo_declaration_id, params do
    _create! params, user_resource(user_id, ubo_declaration_id) ++ ["ubos"]
  end

  @doc """
  Update a ubo.

  ## Examples
      params                 = %{
        "FirstName": "Bob",
        "LastName": "Snow",
        "Address": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "Nationality": "BE",
        "Birthday": 1463496101,
        "Birthplace": %{
          "City": "Namur",
          "Country": "BE"
        }
      }
      {:ok, ubo_declaration} = MangoPay.UboDeclaration.create("ubo_declaration_id", params)

  """
  def update user_id, ubo_declaration_id, ubo_id, params do
    _update params, user_resource(user_id, ubo_declaration_id) ++ ["ubos", ubo_id]
  end

  @doc """
  Update a ubo.

  ## Examples
      params                 = %{
        "FirstName": "Bob",
        "LastName": "Snow",
        "Address": %{
          "AddressLine1": "1 Mangopay Street",
          "AddressLine2": "The Loop",
          "City": "Paris",
          "Region": "Ile de France",
          "PostalCode": "75001",
          "Country": "FR"
        },
        "Nationality": "BE",
        "Birthday": 1463496101,
        "Birthplace": %{
          "City": "Namur",
          "Country": "BE"
        }
      }
      ubo_declaration = MangoPay.UboDeclaration.create!("ubo_declaration_id", params)

  """
  def update! user_id, ubo_declaration_id, ubo_id, params do
    _update! params, user_resource(user_id, ubo_declaration_id) ++ ["ubos", ubo_id]
  end
  @doc """
  Submit a ubo for a user and ubo.

  ## Examples
      user_id             = Id of a user object
      ubo_declaration_id  = Id of a ubo declaration object
      params              = %{
        "Status": "VALIDATION_ASKED"
      }
      {:ok, ubo} = MangoPay.UboDeclaration.submit(user_id, params)

  """
  def submit user_id, ubo_declaration_id, params do
    _update params, user_resource(user_id, ubo_declaration_id)
  end

  @doc """
  Submit a ubo for a user and ubo.

  ## Examples
      user_id             = Id of a user object
      ubo_declaration_id  = Id of a ubo declaration object
      params      = %{
        "Status": "VALIDATION_ASKED"
      }
      ubo = MangoPay.UboDeclaration.submit!("user_id", params)

  """
  def submit! user_id, ubo_declaration_id, params do
    _update! params, user_resource(user_id, ubo_declaration_id)
  end

  def test_user_resource(user_id, resource_id) do
    user_resource(user_id, resource_id)
  end
end
