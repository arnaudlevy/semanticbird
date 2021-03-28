class Tweet < ApplicationRecord
  belongs_to :account

  def create_from_object(object)
    self.text = object.text
    self.url = object.uri
    self.created_at = object.created_at
    self.updated_at = object.created_at
    self.save
  end

  def to_s
    "#{text}"
  end
end
