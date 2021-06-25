require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do
    cat = Cat.create age: 3, enjoys: "Likes to eat a lot" 
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    cat = Cat.create name: "Cat", enjoys: "Likes to eat a lot" 
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys" do
    cat = Cat.create name: "Cat", age: 3
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "enjoys should have a min length of 10" do
    cat = Cat.create name:"Cat", age:3, enjoys: "Eating"
    expect(cat.errors[:enjoys]).to_not be_empty
  end

end
