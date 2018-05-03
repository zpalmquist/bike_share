require 'rails_helper'

describe Order, type: :model do
  describe "validations" do
    it {should validate_presence_of(:total)}
    it {should validate_presence_of(:status)}
  end

  describe "relationships" do
    it {should have_many :items}
    it {should belong_to :user}
  end
end
