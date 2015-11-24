json.array!(@connector_details) do |connector_detail|
  json.extract! connector_detail, :id, :projectname, :filetype, :connectorname, :datasource, :credentials, :mapping, :cronexpression
  json.url connector_detail_url(connector_detail, format: :json)
end
