json.array!(@screenshots) do |screenshot|
  json.extract! screenshot, :id, :image, :product_id
  json.url screenshot_url(screenshot, format: :json)
end
