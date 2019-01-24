module Attachinary
  class File
    include ::Mongoid::Document
    include ::Mongoid::Timestamps
    include Mongoid::Attributes::Dynamic
    include FileMixin

    field :public_id, type: String
    field :version, type: String
    field :width, type: Integer
    field :height, type: Integer
    field :format, type: String
    field :resource_type, type: String
    field :position, type: Integer, default: 0
    
    embedded_in :attachinariable, polymorphic: true
  end
end
