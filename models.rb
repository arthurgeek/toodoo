require "dm-core"

DataMapper.setup(:default, 'sqlite3::memory:')

class Task
  include DataMapper::Resource
  
  property :id, Serial
  property :description, String
  property :done, Boolean
  
  def self.all_pending
    all(
      :done => false
    )
  end
  
  def self.all_completed
    all(
      :done => true
    )
  end
end