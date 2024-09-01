# frozen_string_literal: true

require_relative "string_calculator/version"

# Module to perform string calculations
module StringCalculator
  class Error < StandardError; end

  def self.detect_negatives(numbers)
    negatives = numbers.split(",").select { |number| number.to_i.negative? }
    raise Error, "negatives not allowed: #{negatives.join(", ")}" if negatives.any?
    numbers
  end

  def self.detect_dynamic_delimiter(numbers)
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
      numbers.gsub!(delimiter, ",")
    end
    numbers
  end

  def self.sanitize_input(numbers)
    numbers.gsub("\n", ",")
  end

  def self.sum(numbers)
    numbers.split(",").map(&:to_i).sum
  end

  def self.add(numbers)
    sum detect_negatives sanitize_input detect_dynamic_delimiter(numbers)
  end
end
