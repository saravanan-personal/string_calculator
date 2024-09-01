# frozen_string_literal: true

require_relative "string_calculator/version"

# Module to perform string calculations
module StringCalculator
  class Error < StandardError; end
  
  def self.add(numbers)
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
      numbers.gsub!(delimiter, ",")
    end
    numbers.gsub("\n", ",").split(",").map(&:to_i).sum
  end
end
