class RedisBenchmarker
  def initialize
   @redis = Redis.new 
  end

  def populate_cache
    400000.times do |index|
      p index
      @redis.mset(make_key(index), "bladlfkjsdlkfj lksdjflk sdjklf jsdlk fjlkdsj lkfjdlk jflksdj flkjsd lkfjsdlk jflksdj lfksjdk lfjsdlk jfklsdj flksjdl kfjskldj flksjdlkf jsdlkjf lksdjf lksdj flkjsdlk fjsdlk fjlsdk jfklsd jflksdj flksjd lkfjslkd jfskldj flksdj flksdj lkfjsd lfjlsdkbalbalbalbalabalba lasdaskldjaslkdj klasj lkdjsakl jdlkasj kdljaslk djalksj dlkasj dlkjsa lkdjlask jdlkasj lkdjaslk jdlkasj dlkjsa lkdjlkasjd lkasjlk djaslkdj lkasj dlkas as dasdasdaab lab lab labl blab lab lab lab labal bal balab lab l")
    end
  end

  def bencz
    Benchmark.bm do |x|
      x.report{
        100.times do
          @redis.mget(set)
        end
      }
    end
  end

  private

  def set
    (1..2000).to_a.map{|k| make_key k}
  end

  def make_key(word_id)
    "word_id_mother_fucker_#{word_id}"
  end
end


# RedisBenchmarker.new.bencz
# 300times, 2000 keys
#        user     system      total        real
#   11.250000   0.170000  11.420000 ( 12.370753)
#  => [ 11.250000   0.170000  11.420000 ( 12.370753)

# 100 times, 2000 keys
# 1.9.3-p286 :013 > RedisBenchmarker.new.bencz
#        user     system      total        real
#    3.810000   0.060000   3.870000 (  4.174762)
#  => [  3.810000   0.060000   3.870000 (  4.174762)

# 100 times, 2000 keys
# 1.9.3-p286 :015 > RedisBenchmarker.new.bencz
#        user     system      total        real
#    7.580000   0.120000   7.700000 (  8.316613)
#  => [  7.580000   0.120000   7.700000 (  8.316613)
# ]
