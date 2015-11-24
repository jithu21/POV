class Dailymail
  include Mongoid::Document
  field :type, type: String
  field :slotid, type: String
  field :siteid, type: Integer
  field :sitename, type: String
  field :pricelevel, type: String
  field :requestid, type: Integer
  field :adunit, type: Integer
  field :dealid, type: String
  field :domain, type: String
  field :country, type: String
  field :state, type: String
  field :dma, type: String
  field :connectionspeed, type: String
  field :os, type: String
  field :browser, type: String
  field :devicetype, type: String
  field :language, type: String
  field :dspname, type: String
  field :brandid, type: Integer
  field :brandname, type: String
  field :campaignid, type: Integer
  field :usermatchstatus, type: String
  field :timestamp, type: Time
  field :winrate, type: BigDecimal
  field :bidrate, type: BigDecimal
  field :clearprice, type: BigDecimal
end
