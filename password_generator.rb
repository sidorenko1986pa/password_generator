class PasswordGenerator

  ALPHABET = *('a'..'z')
  VOWELS = ['a', 'e', 'i', 'o', 'u']
  CONSONANTS = ALPHABET - VOWELS
  LIST_PASSWORDS = 15

  def initialize
    @result_list = []
  end

  def check_vowel_or_consonant(letter)
    VOWELS.include?(letter) ? PasswordGenerator.check_double_vowels(letter, @result) : PasswordGenerator.check_double_consonants(letter, @result)
  end

  def generator(arg)
    p CONSONANTS
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

  private
    def self.check_double_vowels(letter, result)
      (VOWELS & result.last(2)).size == 2 ? CONSONANTS.sample : letter
    end

    def self.check_double_consonants(letter, result)
      (CONSONANTS & result.last(2)).size == 2 ? VOWELS.sample : letter
    end
end

password = PasswordGenerator.new
puts "Введите длинну пароля"
puts password.generator(size: STDIN.gets.chomp.to_i)