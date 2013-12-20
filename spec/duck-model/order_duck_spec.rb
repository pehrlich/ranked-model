require 'spec_helper'

describe OrderDuck do

  before {
    @ducks = {
      :quacky => OrderDuck.create(
        :name => 'Quacky',
        :order => RankedModel::MAX_RANK_VALUE),
      :feathers => OrderDuck.create(
        :name => 'Feathers',
        :order => RankedModel::MAX_RANK_VALUE - 1)
    }
  }

  it "it should allow ordering by a field named order" do
    @ducks[:feathers].order_position = 0
    @ducks[:feathers].save!
  end

end