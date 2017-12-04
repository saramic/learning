require 'spec_helper'
require 'spiral'

RSpec.describe Spiral do
  context '#rel_max_limit' do
    context '1x1' do
      let(:spiral) { Spiral.new(1) }
      it { expect(spiral.rel_min_limit(1)).to eq 0 }
      it { expect(spiral.rel_max_limit(1)).to eq 0 }
    end

    context '3x3' do
      let(:spiral) { Spiral.new(9) }
      it { expect(spiral.rel_min_limit(1)).to eq 1 }
      it { expect(spiral.rel_max_limit(1)).to eq 1 }
      it { expect(spiral.rel_min_limit(2)).to eq 0 }
      it { expect(spiral.rel_max_limit(2)).to eq 2 }
      it { expect(spiral.rel_min_limit(9)).to eq 0 }
      it { expect(spiral.rel_max_limit(9)).to eq 2 }
    end

    context '5x5' do
      let(:spiral) { Spiral.new(25) }
      it { expect(spiral.rel_min_limit(1)).to eq 2 }
      it { expect(spiral.rel_max_limit(1)).to eq 2 }
      it { expect(spiral.rel_min_limit(2)).to eq 1 }
      it { expect(spiral.rel_max_limit(2)).to eq 3 }
      it { expect(spiral.rel_min_limit(9)).to eq 1 }
      it { expect(spiral.rel_max_limit(9)).to eq 3 }
      it { expect(spiral.rel_min_limit(10)).to eq 0 }
      it { expect(spiral.rel_max_limit(10)).to eq 4 }
      it { expect(spiral.rel_min_limit(25)).to eq 0 }
      it { expect(spiral.rel_max_limit(25)).to eq 4 }
    end
  end
end
