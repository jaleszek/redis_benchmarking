module CacheKeyBuilder
  def word_key(word_slug, word_lang_id, definition_lang_id)
    "word_cache_#{word_lang_id}_#{definition_lang_id}_#{word_slug}"
  end

  def word_keys(word_slugs, word_lang_id, definition_lang_id)
    word_slugs.map do |word_slug|
      word_key(word_slug, word_lang_id, definition_lang_id)
    end
  end
end