
module Stopwatch
  def time(label=nil,&blk)
    print "#{label}: " if label
    t0 = Time.now
    blk.call
    puts Time.now-t0
  end
end


