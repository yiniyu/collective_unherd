require 'rails_helper'

RSpec.describe BoardMember, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    it { should have_many(:committees) }

    it { should have_many(:responses) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
