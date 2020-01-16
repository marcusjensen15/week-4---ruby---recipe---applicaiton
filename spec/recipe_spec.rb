require 'rails_helper'

describe Recipe, type: :model do
  it { should have_and_belong_to_many(:ingredients) }
  it { should have_and_belong_to_many(:tags) }


end
