require 'rails_helper'

describe Ingredient, type: :model do
  it { should have_and_belong_to_many(:recipes) }


end
