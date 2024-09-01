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
    
    context "it can handle n numbers" do
      it "returns 6 for '1,2,3'" do
        expect(StringCalculator.add("1,2,3")).to eq(6)
      end

      it "returns 10 for '1,2,3,4'" do
        expect(StringCalculator.add("1,2,3,4")).to eq(10)
      end
    end
    
    context "it can handle new lines" do
      it "returns 6 for '1\n2,3'" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end

      it "returns 10 for '1\n2\n3,4'" do
        expect(StringCalculator.add("1\n2\n3,4")).to eq(10)
      end
    end
    
    context "it supports dynamic delimiters" do
      it "returns 3 for '//;\n1;2'" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

      it "returns 6 for '//@\n1@2@3'" do
        expect(StringCalculator.add("//@\n1@2@3")).to eq(6)
      end
    end
    
    context "it supports new line as dynamic delimiter" do
      it "returns 6 for '//\n\n1\n2\n3'" do
        expect(StringCalculator.add("//\n\n1\n2\n3")).to eq(6)
      end
    end
    
    context "it raises an exception for negative numbers" do
      it "raises an exception for '-1'" do
        expect { StringCalculator.add("-1") }.to raise_error(StringCalculator::Error, "negatives not allowed: -1")
      end

      it "raises an exception for '-1,-2,3'" do
        expect { StringCalculator.add("-1,-2") }.to raise_error(StringCalculator::Error, "negatives not allowed: -1, -2")
      end
    end
  end
end
