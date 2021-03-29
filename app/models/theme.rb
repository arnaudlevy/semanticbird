class Theme < ApplicationRecord
  belongs_to :parent, class_name: 'Theme', optional: true, inverse_of: :children
  has_many :children, class_name: 'Theme', foreign_key: :parent_id, inverse_of: :parent
  has_and_belongs_to_many :tweets

  scope :root, -> { where(parent: nil) }
  scope :with_lexem, -> (lexem) { where('lexems like ?', "%|#{lexem.value}|%") }
  default_scope { order(:name)}

  def toggle(lexem)
    contains?(lexem)  ? remove!(lexem)
                      : add!(lexem)
  end

  def ancestors_and_self
    list = [self]
    list = parent.ancestors_and_self.concat list if parent
    list
  end

  def to_s
    "#{name}"
  end

  protected

  def contains?(lexem)
    lexem.in? lexems_array
  end

  def add!(lexem)
    lexems_array << lexem
    write_lexems
  end

  def remove!(lexem)
    lexems_array.delete lexem
    write_lexems
  end

  def lexems_array
    @lexems_array ||= lexems.to_s.split '|'
  end

  def write_lexems
    self.lexems = "|#{lexems_array.join '|'}|"
    self.save
  end
end
