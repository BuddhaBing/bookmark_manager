require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  storage_names[:default] = 'link' # TODO not sure what this does - look into this

  # Has, and belongs to, many (Or Many-To-Many)
  # The use of Resource in place of a class name tells DataMapper to use an anonymous resource to link the two models up.
  has n, :tags, through: Resource # has_and_belongs_to_many - many tags can belong to each link, and each link can belong to many tags.
  # Creates a new table for each "many-to-many" relationship.

  property :id,     Serial
  property :title,  String
  property :url,    String
end
