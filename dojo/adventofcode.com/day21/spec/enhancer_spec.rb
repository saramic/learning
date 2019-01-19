require 'spec_helper'
require 'enhancer'

class TestClass
  include Enhancer
end
RSpec.describe Enhancer do
  describe '#split_into_sub_images' do
    let(:img) { <<-EOF.gsub(/^\s*/, '').split("\n").map(&:chars)
      #..#
      ....
      ####
      ##..
    EOF
    }
    let(:expected) {
      [
        [%w(# .), %w(. .)], [%w(. #), %w(. .)],
        [%w(# #), %w(# #)], [%w(# #), %w(. .)],
      ]
    }

    subject { TestClass.new.split_into_sub_images(img) }
    it { is_expected.to eq(expected) }
  end

  describe '#rotate' do
    let(:img) { <<-EOF.gsub(/^\s*/, '').split("\n").map(&:chars)
      123
      456
      789
    EOF
    }
    let(:expected) {
      [
        %w(7 4 1),
        %w(8 5 2),
        %w(9 6 3),
      ]
    }

    subject { TestClass.new.rotate(img) }
    it { is_expected.to eq(expected) }
  end

  describe '#finger_prints' do
    let(:img) { <<-EOF.gsub(/^\s*/, '').split("\n").map(&:chars)
      #.
      ..
    EOF
    }
    let(:expected) {
      %w( 
        #./.. .#/..
        .#/.. #./..
        ../.# ../#.
        ../#. ../.#
      )
    }

    subject { TestClass.new.finger_prints(img) }
    it { is_expected.to eq(expected) }
  end

  describe '#combine_sub_images' do
    let(:imgs) {
      [
        [%w(1 2), %w(3 4)],
        [%w(5 6), %w(7 8)],
        [%w(9 a), %w(b c)],
        [%w(d e), %w(f 0)],
      ]
    }
    let(:expected) {
      [
        %w(1 2 5 6),
        %w(3 4 7 8),
        %w(9 a d e),
        %w(b c f 0),
      ]
    }

    subject { TestClass.new.combine_sub_images(imgs) }
    it { is_expected.to eq(expected) }
  end

  describe '#combine_sub_images' do
    let(:imgs) {
      [
        [%w(1)],
        [%w(2)],
        [%w(3)],
        [%w(4)],
      ]
    }
    let(:expected) {
      [
        %w(1 2),
        %w(3 4),
      ]
    }

    subject { TestClass.new.combine_sub_images(imgs) }
    it { is_expected.to eq(expected) }
  end
end

