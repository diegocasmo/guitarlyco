module ArticlesHelper

  def get_short_body(body)
    truncate(body, length: 300)
  end
end
