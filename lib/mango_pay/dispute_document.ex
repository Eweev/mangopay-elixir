defmodule MangoPay.DisputeDocument do
  @moduledoc """
  Functions for MangoPay dispute document.

  MangoPay official API documentation: https://docs.mangopay.com/endpoints/v2.01/dispute-documents#e214_the-dispute-document-object
  """
  use MangoPay.Query.Base
  set_action "dispute-documents", [{:get}]

  @doc """
  Create a dispute document.

  ## Examples
      params                  = %{
        "Tag": "custom meta",
        "Type": "DELIVERY_PROOF"
      }
      {:ok, dispute_document} = MangoPay.DisputeDocument.create("dispute_id", params)

  """
  def create dispute_id, params do
    _create params, resource_document(dispute_id)
  end

  @doc """
  Create a page for a dispute document.

  ## Examples
      params                  = %{
        File: "blahblah"
      }
      {:ok, dispute_document_page} = MangoPay.DisputeDocument.create_page("dispute_id", "dispute_document_id", params)

  """
  def create_page dispute_id, dispute_document_id, params do
    _create params,  resource_document(dispute_id, dispute_document_id) ++ ["pages"]
  end

  @doc """
  Submit a dispute document.

  ## Examples
      params                  = %{
        "Status": "CREATED"
      }
      {:ok, dispute_document} = MangoPay.DisputeDocument.submit("dispute_id", params)

  """
  def submit dispute_id, dispute_document_id do
    _update %{"Status": "CREATED"}, resource_document(dispute_id, dispute_document_id)
  end

  @doc """
  All dispute documents by dispute.

  ## Examples
      {:ok, dispute_documents} = MangoPay.DisputeDocument.all_by_dispute("dispute_id")

  """
  def all_by_dispute id, query \\ nil do
    _all resource_document(id), query
  end

  @doc """
  Consult a dispute document page.

  ## Examples
      {:ok, dispute_document} = MangoPay.DisputeDocument.consult("dispute_id")

  """
  def consult id do
    _create %{}, [resource(id), "consult"]
  end

  def resource_document(dispute_id), do: ["disputes", dispute_id, "documents"]
  def resource_document(dispute_id, dispute_document_id), do: resource_document(dispute_id) ++ ["#{dispute_document_id}"]
end
