class Language < ActiveRecord::Base

  # TODO: add creating to migration
  # TODO: remove, and refactor if neccessary
  ENGLISH_ID = 1
  POLISH_ID = 2

  begin :attributes
    attr_accessible :name, :symbol, :locale
  end

  begin :relations
    has_many :definitions

    # just to have bidirectional relations; probably won't be needed.
    has_many :word_users, foreign_key: :words_language_id, class_name: "Language"
    has_many :definition_users, foreign_key: :definitions_language_id, class_name: "Language"

    has_many :words
  end

  begin :validations
    validates :name, :presence => true, :uniqueness => true
    validates :symbol, :presence => true, :uniqueness => true
  end
end
