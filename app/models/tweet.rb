class Tweet < ApplicationRecord
  belongs_to :account
  has_and_belongs_to_many :themes

  after_save :link_to_themes

  default_scope { order(created_at: :desc)}

  def create_from_object(object)
    self.text = object.text
    self.url = object.uri
    self.created_at = object.created_at
    self.updated_at = object.created_at
    self.save
  end

  def clean_text
    CGI.unescapeHTML text
  end

  def lexems
    Lexem.list clean_text
  end

  def to_s
    "#{text}"
  end

  protected

  def link_to_themes
    self.themes = []
    lexems.each do |lexem|
      lexem.themes.each do |theme|
        self.themes << theme unless theme.in? self.themes
      end
    end
  end
end
