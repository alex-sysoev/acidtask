class Clicker < ActiveRecord::Base

  #Structure
  #id, name, ip, timestamps

  #Attributes

  #Validations
  validates :name, presence: true

  #Associations

  #Callbacks

  #Scopes
  scope :sorted, -> { order( created_at: :desc ) }

  #Methods--------------------------------

  def self.verify_signature(name,signature)
    s = Digest::SHA1.hexdigest( "#{name}sblsss" )
    s == signature
  end

  #---------------------------------------

end
