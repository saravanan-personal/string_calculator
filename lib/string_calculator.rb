# frozen_string_literal: true

require_relative 'string_calculator/version'

# Module to perform string calculations
module StringCalculator
  class Error < StandardError; end

  VALID_INPUT_FORMAT = /\A-?\d+(,-?\d+)*\z/
  
  def self.add(numbers)
    sum detect_negatives sanitize_input detect_dynamic_delimiter(numbers)
  end
  
  private
  
  def self.detect_dynamic_delimiter(numbers)
    if numbers.start_with?("//")
      delimiter = numbers[2]
      # check for new line after delimiter
      numbers[3] == "\n" ? numbers = numbers[4..-1] : numbers = numbers[3..-1]
      numbers.gsub!(delimiter, ",")
    end
    numbers
  end
  
  def self.sanitize_input(numbers)
    numbers = numbers.gsub("\n", ",")
    return "" if numbers.empty?

    validate_input_format numbers
  end

  def self.validate_input_format(numbers)
    # number should contain only digits, and have delimiter between them
    raise Error, 'invalid input format' unless numbers.match?(VALID_INPUT_FORMAT)

    numbers
  end

  def self.detect_negatives(numbers)
    negatives = numbers.split(",").select { |number| number.to_i.negative? }
    raise Error, "negatives not allowed: #{negatives.join(", ")}" if negatives.any?
    numbers
  end

  def self.sum(numbers)
    numbers.split(",").map(&:to_i).sum
  end
end
