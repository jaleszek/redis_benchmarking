class WordCacher
  include CacheKeyBuilder

  def cache_words
    counter = 0
    [Language::POLISH_ID, Language::ENGLISH_ID].each do |lang_id|
      Word.with_definitions(lang_id).each do |word|
        counter += 2
        WORDS_CACHE_CONNECTION.mset(word_key(word.value_slug, Language::ENGLISH_ID, lang_id), serialize(word))
        WORDS_CACHE_CONNECTION.mset(word_key(word.id, Language::ENGLISH_ID, lang_id), serialize(word))
      end
    end
    p "dodano #{counter} kluczy kesza"
  end

  private

  def serialize(word_relation)
    Marshal::dump(word_relation)
  end
end