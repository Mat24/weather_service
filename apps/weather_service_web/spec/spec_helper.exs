ESpec.configure fn(config) ->
  config.before fn(tags) ->
    {:ok, _} = Application.ensure_all_started(:ex_machina)
    {:shared, hello: :world, tags: tags}
  end

  config.finally fn(_shared) ->
    :ok
  end
end
Code.require_file("spec/phoenix_helper.exs")
