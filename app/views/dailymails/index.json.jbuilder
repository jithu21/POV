json.array!(@dailymails) do |dailymail|
  json.extract! dailymail, :id, :type, :slotid, :siteid, :sitename, :pricelevel, :requestid, :adunit, :dealid, :, :domain, :country, :state, :dma, :connectionspeed, :os, :browser, :devicetype, :language, :dspname, :, :brandid, :brandname, :campaignid, :usermatchstatus, :timestamp, :winrate, :bidrate, :clearprice
  json.url dailymail_url(dailymail, format: :json)
end
