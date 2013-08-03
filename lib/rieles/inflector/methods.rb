module Rieles
  module Inflector
    def apply_inflections(word, rules)
      result = word.to_s.dup

      if word.empty? || inflections.uncountables.include?(result.downcase[/\b\w+\Z/])
        result
      else
        rules.each { |(rule, replacement)| break if result.gsub!(rule, replacement) }
        result
      end
    end
  end
end
