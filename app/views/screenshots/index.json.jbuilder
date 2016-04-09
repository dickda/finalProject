json.array!(@screenshots) do |screenshot|
  json.extract! screenshot, :id, :image
  json.url screenshot_url(screenshot, format: :json)
end
