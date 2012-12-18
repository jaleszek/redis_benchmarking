# encoding: utf-8

class WordBenchmark
  def self.bencz1(refresh_db = false)
    Importers::Dictionaries::PwnWordnet.new.save if refresh_db
    Benchmark.bm do |x|
      x.report{
        p "caching some words"
        WordCacher.new.cache_words
      }
      a = Word.all.to_a
      x.report{
        p "getting some"
        a.each do |word|
          Word.find_cached(word.value, 2)
        end
      }

      x.report{
        p "getting arrays"
        p "500 elements array"
        x = Word.find_cached(a.first(500).map(&:value), 2)
        p "#{x.size} words founded"
      }
    end
  end
end