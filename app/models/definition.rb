class Definition < ActiveRecord::Base
  attr_accessible :fakes, :value, :language_id

  validates :value, :presence => true
  validates :word_id, :presence => true
  validates :language_id, :presence => true

  validates_with DefinitionFakesValidator

  serialize :fakes, Array

  belongs_to :word
  belongs_to :language
end