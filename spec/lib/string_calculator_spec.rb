# frozen_string_literal: true

require 'spec_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    context 'with valid input' do
      it 'returns 0 for an empty string' do
        expect(StringCalculator.add('')).to eq(0)
      end

      it "returns 3 for '1,2'" do
        expect(StringCalculator.add('1,2')).to eq(3)
      end

      context 'it can handle n numbers' do
        it "returns 6 for '1,2,3'" do
          expect(StringCalculator.add('1,2,3')).to eq(6)
        end

        it "returns 10 for '1,2,3,4'" do
          expect(StringCalculator.add('1,2,3,4')).to eq(10)
        end
      end

      context 'it can handle more than one digit' do
        it "returns 101 for '100,1'" do
          expect(StringCalculator.add('100,1')).to eq(101)
        end
      end
    end
    
    context 'when the input has line breaks' do
      it "returns 10 for '1\n2\n3,4'" do
        expect(StringCalculator.add("1\n2\n3,4")).to eq(10)
      end
    end
    
    context 'when input has delimiters at the begining' do
      context 'uses delimiters from input string' do
        it "returns 3 for '//;\n1;2'" do
          expect(StringCalculator.add("//;\n1;2")).to eq(3)
        end

        it "returns 6 for '//@\n1@2@3'" do
          expect(StringCalculator.add("//@\n1@2@3")).to eq(6)
        end
      end

      context 'it supports new line as dynamic delimiter' do
        it "returns 6 for '//\n\n1\n2\n3'" do
          expect(StringCalculator.add("//\n1\n2\n3")).to eq(6)
        end
      end
    end
    
    context 'when the input is invalid' do
      context 'it raises an exception for negative numbers' do
        it "raises an exception for '-1'" do
          expect { StringCalculator.add('-1') }.
            to raise_error(StringCalculator::Error, 'negatives not allowed: -1')
        end

        it "raises an exception for '-1,-2,3'" do
          expect { StringCalculator.add('-1,-2') }.
            to raise_error(StringCalculator::Error, 'negatives not allowed: -1, -2')
        end
      end

      context 'it throws an exception for invalid input format' do
        it "raises an exception for '1,2,3a'" do
          expect { StringCalculator.add('1,2,3a') }.
            to raise_error(StringCalculator::Error, 'invalid input format')
        end

        it "raises an exception for '//;\n1;;2;3'" do
          expect { StringCalculator.add("//;\n1;;2;3") }.
            to raise_error(StringCalculator::Error, 'invalid input format')
        end
      end
    end
  end
end
