require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:committees) }

    it { should have_many(:board_members) }

    it { should have_many(:my_questions) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
