defmodule Parser.Parse do
  def to_html(text) do

  end

  def italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
  end
end
