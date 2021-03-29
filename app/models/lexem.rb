class Lexem
  def self.list(text)
    # Link at the end
    clean_text = text.split('https://').first
    # Punctuation
    clean_text.gsub! ',', ' '
    clean_text.gsub! '/', ' '
    clean_text.gsub! '|', ' '
    clean_text.gsub! '.', ' '
    clean_text.gsub! '!', ' '
    clean_text.gsub! ':', ' '
    clean_text.gsub! '?', ' '
    # Mentions
    clean_text.gsub! 'RT', ' '
    # Space before
    clean_text.gsub! ' %', '%'
    clean_text.gsub! ' €', '€'
    clean_text.gsub! ' | ', ' '
    clean_text.gsub! '  ', ' '
    clean_text.downcase!
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

  def themes
    Theme.with_lexem self
  end
end
