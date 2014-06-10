require 'rails_helper'

RSpec.describe Clicker, :type => :model do

  describe 'validations' do
    it 'is valid with name present' do
      clicker = FactoryGirl.build( :clicker )
      expect(clicker).to be_valid
    end

    it 'is invalid without name' do
      clicker = FactoryGirl.build( :clicker, name: nil )
      expect(clicker).not_to be_valid
    end
  end

end
