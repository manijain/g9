json.array!(@property_attachments) do |property_attachment|
  json.extract! property_attachment, :id, :property_id, :avatar
  json.url property_attachment_url(property_attachment, format: :json)
end
