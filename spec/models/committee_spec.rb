require 'rails_helper'

RSpec.describe Committee, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    it { should belong_to(:board_members) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
