
def func1
  puts __method__
end

puts "Started At #{Time.now}"
t1 = Thread.new{func1()}
t2 = Thread.new{func1()}
t1.join
t2.join
puts "End at #{Time.now}"
