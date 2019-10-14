# https://github.com/kapoorlakshya/screen-recorder

require 'screen-recorder'

class MyScreenRecorder

  def initialize(file_name = 'recording.mkv')
    @file_name = file_name
    @recorder = ScreenRecorder::Desktop.new(output: file_name)
  end

  def start_recording
    @recorder.start
  end

  def stop_recording
    @recorder.stop
  end
end
