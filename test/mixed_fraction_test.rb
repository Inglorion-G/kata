require "minitest/spec"
require "minitest/autorun"
require_relative "../kata/mixed_fraction.rb"

class MixedFractionTest < Minitest::Test
  extend Minitest::Spec::DSL

  describe "#mixed_fraction" do
    it "returns the correct value" do
      assert_equal "4 2/3", mixed_fraction("42/9")
      assert_equal "2", mixed_fraction("6/3")
      assert_equal "2/3", mixed_fraction("4/6")
      assert_equal "-2/3", mixed_fraction("4/-6")
      assert_equal "0", mixed_fraction("0/18891")
      assert_equal "-1 3/7", mixed_fraction("-10/7")
      assert_equal "-1 3/7",mixed_fraction("10/-7")
      assert_equal "3 1/7", mixed_fraction("-22/-7")
    end
  end
end
