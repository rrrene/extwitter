defmodule ExTwitter.API.DirectMessages do
  @moduledoc """
  Provides direct_messages API interfaces.
  """

  import ExTwitter.API.Base

  def new(user_id, text, options \\ []) do
    params = ExTwitter.Parser.parse_request_params(parse_user_id_param(user_id) ++ [text: text] ++ options)
    request(:post, "1.1/direct_messages/new.json", params)
      |> ExTwitter.Parser.parse_direct_message
  end

  defp parse_user_id_param(user_id) when is_integer(user_id) do
    [user_id: user_id]
  end

  defp parse_user_id_param(screen_name) do
    [screen_name: screen_name]
  end
end
