ESpec.configure fn(config) ->
  config.before fn(tags) ->
    {:shared,
     api_response: "{\"coord\":{\"lon\":-74.08,\"lat\":4.6},\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03d\"}],\"base\":\"stations\",\"main\":{\"temp\":290.15,\"pressure\":1024,\"humidity\":51,\"temp_min\":290.15,\"temp_max\":290.15},\"visibility\":10000,\"wind\":{\"speed\":5.1,\"deg\":60},\"clouds\":{\"all\":40},\"dt\":1515704400,\"sys\":{\"type\":1,\"id\":4245,\"message\":0.0044,\"country\":\"CO\",\"sunrise\":1515668896,\"sunset\":1515711664},\"id\":3688689,\"name\":\"Bogota\",\"cod\":200}",
     tags: tags}
  end

  config.finally fn(_shared) ->
    :ok
  end
end
