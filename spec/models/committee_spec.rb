require 'rails_helper'

RSpec.describe Committee, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    it { should have_one(:board_member) }

    end

    describe "Validations" do
      
    end
end
