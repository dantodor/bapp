
defmodule BmappWeb.ErrorHelpers do
  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(BmappWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(BmappWeb.Gettext, "errors", msg, opts)
    end
  end
end
