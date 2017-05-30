class PasswordGenerator

  ALPHABET = *('a'..'z')
  VOWELS = ['a', 'e', 'i', 'o', 'u']
  CONSONANTS = ALPHABET - VOWELS
  LIST_PASSWORDS = 15

  def initialize
    @result_list = []
  end

  def check_double_vowels(letter)
    (VOWELS & @result.last(2)).size == 2 ? CONSONANTS.sample : letter
  end

  def check_double_consonants(letter)
    (CONSONANTS & @result.last(2)).size == 2 ? VOWELS.sample : letter
  end

  def check_vowel_or_consonant(letter)
    VOWELS.include?(letter) ? check_double_vowels(letter) : check_double_consonants(letter)
  end

  def generator(arg)
    if arg[:size] > 3
      LIST_PASSWORDS.times do
        @result = []
        arg[:size].times { @result << check_vowel_or_consonant(ALPHABET.sample) }
        @result_list << @result.join
      end
      @result_list.join("\n")
    else
      puts 'Слабый пароль'
      exit 1
    end
  end
end

password = PasswordGenerator.new
puts "Введите длинну пароля"
puts password.generator(size: gets.chomp.to_i)