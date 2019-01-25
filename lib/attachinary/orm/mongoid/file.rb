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
    field :position, type: Integer, default: 1
    
    embedded_in :attachinariable, polymorphic: true
    
    before_validation :save_position
    
    private
    
    def save_position
      self.position = (self._index + 1) if self.new_record?
    end
  end
end
