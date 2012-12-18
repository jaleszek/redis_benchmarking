module WordPicker
  include CacheKeyBuilder
  def find_cached(words_array, definition_lang_id, word_lang_id = Language::ENGLISH_ID)
    words_array = Array(words_array)
    Word; Definition
    response = WORDS_CACHE_CONNECTION.mget(word_keys(words_array, word_lang_id, definition_lang_id))
    if response.compact.present?
      response.map do |w|
        w ? Marshal.load(w) : nil
      end
    end
  end
end