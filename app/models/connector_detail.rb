class ConnectorDetail
  include Mongoid::Document
  field :projectname, type: String
  field :filetype, type: String
  field :connectorname, type: String
  field :datasource, type: String
  field :credentials, type: Hash
  field :mapping, type: Array
  field :cronexpression, type: String
  validates :projectname,  :presence => true,:length => {
                                                 :minimum   => 3,
                                                 :maximum   => 25,
                                                 :too_short => "must have at least %{count} words",
                                                 :too_long  => "must have at most %{count} words"
                                               }, :uniqueness =>{:case_sensitive => false} , :on => :create
  validates :filetype,  :presence => true
  validates :connectorname,  :presence => true
  validates :datasource,  :presence => true
  validates :credentials,  :presence => true
  validates :mapping,  :presence => true
  validates :cronexpression,  :presence => true

end