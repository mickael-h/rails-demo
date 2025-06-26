require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { build(:recipe) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:ingredients) }
  it { should validate_presence_of(:instructions) }
end
