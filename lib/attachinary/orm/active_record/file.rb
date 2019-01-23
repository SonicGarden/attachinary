module Attachinary
  class File < ::ActiveRecord::Base
    belongs_to :attachinariable, polymorphic: true
    include FileMixin
    include RailsSortable::Model
  end
end
