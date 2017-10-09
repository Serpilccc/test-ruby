def cesar_crypt(sentence, key)
  letters = ('a'..'z').to_a.join
  mapping = ('a'..'z').to_a.rotate(key).join
  sentence.tr(letters + letters.upcase, mapping + mapping.upcase)
end

cesar_crypt("What a string!", 5)
