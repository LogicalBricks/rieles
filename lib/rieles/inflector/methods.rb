module Rieles
  module Inflector
    def apply_inflections(word, rules, locale = :es)
      result = word.to_s.dup

      if word.empty? || inflections(locale).uncountables.uncountable?(result)
        result
      else
        rules.each { |(rule, replacement)| break if result.gsub!(rule, replacement) }
        result
      end
    end
  end
end
