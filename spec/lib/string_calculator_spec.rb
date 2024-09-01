# frozen_string_literal: true

require 'spec_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  context "add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns 3 for '1,2'" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end
  end
end
