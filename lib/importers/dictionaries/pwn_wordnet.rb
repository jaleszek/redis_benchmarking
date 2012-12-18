# wordnet frequencies: lingapp Word::Squeezer.new.squeeze leaves only correct definitions
# add phrases: K
# add ratings: before production deploy
# 1 word, 2 words only
# examples, sentences
# formy zalezne

module Importers::Dictionaries
  class PwnWordnet
    def initialize(db_name = "lingapp_development")
      @connection = Mongo::Connection.new.db(db_name)
      @words = @connection["words"].find.to_a
    end

    def save
      # TODO: ask about only 2-word phrases only
      Word.delete_all
      Definition.delete_all
      rescue_array = []

      @words.each_with_index do |word, index|
        w_args = {
          value: word['value'],
          language_id: Language::ENGLISH_ID,
          rating: index, #word['rating'],
          occurrence: word['occurrence'].to_i,
          fakes: mock_fakes
        }
        begin
          word_ = Word.create!(w_args)
        rescue
          rescue_array << w_args
        end
        if word_
          # definitions
          word["definitions"].each do |definition|
            d_args = {
              value: definition['value'],
              language_id: language_id(definition['language_id']),
              fakes: mock_fakes
            }

            begin
              word_.definitions.create!(d_args)
            rescue
              rescue_array << d_args
            end
          end

          # derived forms
          offset = 1000000
          word["derived_forms"].each_with_index do |derived_form, index|
            df_args = {
              value: derived_form['derivation'],
              language_id: Language::ENGLISH_ID,
              rating: index + offset,
              derivation_type: derived_form['derivation_type']
            }
          end
        end
        rescue_array
      end
    end

    private

    def mock_fakes
      ["fake1", "fake2", "fake3", "fake4", "fake5"]
    end

    def language_id(lang_id)
      case lang_id
      when 234
        Language::ENGLISH_ID
      when 233
        Language::POLISH_ID
      end
    end
  end
end