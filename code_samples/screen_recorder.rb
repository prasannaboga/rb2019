sr = MyScreenRecorder.new('myrecording.mp4')

sr.start_recording

puts 'screen is recording..'

(1..10).each do |i|
  sleep(i*2)
  puts i
end

sr.stop_recording


# Flatten array
my_array = [1, [2, 3, [4, [5, 6]]]]

def recursive_flatten(array, results = [])
  array.each do |element|
    if element.class == Array
      recursive_flatten(element, results)
    else
      results << element
    end
  end
  results
end
