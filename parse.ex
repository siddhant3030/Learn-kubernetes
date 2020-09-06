defmodule Markdown do
  def to_html(text) do
    text
    |> p
    |> italics
    |> bold
  end

  def italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
  end

  def bold(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<strong>\\1</strong>")
  end

  def p(text) do
    Regex.replace(~r/(\r\n|\r|\n)^)+([^\r\n]+)()/, text, "<p>\\2</p>"
  end

  def test_str do
    """
    Building a nice parser for myself.
    """
  end
end
