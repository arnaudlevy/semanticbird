class Lexem
  def self.list(text)
    clean_text = text.split('https://').first
    clean_text.gsub! ',', ' '
    clean_text.gsub! '/', ' '
    clean_text.gsub! '|', ' '
    clean_text.gsub! '.', ' '
    clean_text.gsub! '!', ' '
    clean_text.gsub! '?', ' '
    clean_text.gsub! 'RT', ' '
    clean_text.gsub! ' €', '€'
    clean_text.gsub! ':', ' '
    clean_text.gsub! ' | ', ' '
    clean_text.gsub! '  ', ' '
    list = []
    clean_text.split(' ').each_with_index do |l, index|
      lexem = Lexem.new l, index
      list << lexem
    end
    list
  end

  attr_reader :value, :index

  def initialize(value, index)
    @value = value
    @index = index
  end
end
