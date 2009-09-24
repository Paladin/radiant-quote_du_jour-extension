class Quote < ActiveRecord::Base
  validates_presence_of :author, :message => 'required'
  validates_presence_of :quote, :message => 'required'
  
  def self.random( author )
	if( author.blank? )
	  ids = find( :all, :select => 'id' )
	else
  	  ids = find( :all, :select => 'id', :conditions => [ 'author = ? ', author ] )
  	end
  	find(ids[rand(ids.length)]["id"].to_i) unless ids.blank?
  end
  
  def self.list( author )
  	conditions = author.blank? ? [] : [ 'author = ?', author ]
  	find( :all, :conditions => conditions )
  end
end
