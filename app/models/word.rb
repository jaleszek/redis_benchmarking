# encoding: UTF-8

class Word < ActiveRecord::Base
  extend WordPicker

  attr_accessible :fakes, :value, :language_id, :rating, :occurrence

  WORD_VALUE_REGEX = /[a-z]+(([ ]|[-’'`\w])[a-z]+)*/mi
  FAKES_MIN_NUMBER = 5

  validates :value, :presence => true, :uniqueness => true
  validates :occurrence, :presence => true
  validates :rating, :presence => true, :uniqueness => true
  validates :fakes, :presence => true
  validates :language_id, :presence => true

  validates_format_of :value, :with => WORD_VALUE_REGEX

  serialize :fakes, Array

  has_many :definitions, :dependent => :destroy
  belongs_to :language

  scope :with_definitions, ->(*language_id) { includes(:definitions).where(:definitions => {:language_id => language_id}) }

  def value_slug
    self.value.to_slug
  end
end