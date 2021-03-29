class Theme < ApplicationRecord
  belongs_to :parent, class_name: 'Theme', optional: true, inverse_of: :children
  has_many :children, class_name: 'Theme', foreign_key: :parent_id, inverse_of: :parent

  scope :with_lexem, -> (lexem) { where('lexems like ?', "%#{lexem.value}%") }

  def toggle(lexem)
    self.lexems = lexem
    self.save
  end

  def to_s
    "#{name}"
  end
end
