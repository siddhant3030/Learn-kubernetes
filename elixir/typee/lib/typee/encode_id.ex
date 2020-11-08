defmodule Typee.EncodedId do
  use Ecto.Type

  def type, do: :id

  def cast(id) when is_integer(id) do
    {:ok, encode_id(id)}
  end
  def cast(_), do: :error

  def dump(id) when is_binary(id) do
    Base.decode64(id)
  end

  def load(id) when is_integer(id) do
    {:ok, encode_id(id)}
  end

  defp encode_id(id) do
    id
    |> Integer.to_string()
    |> Base.encode64
  end
end
