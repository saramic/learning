require 'date'

class ClockMirroring
  def initialize(time)
    @time = DateTime.parse(time)
  end

  START_TIME = DateTime.parse("00:00:00").to_time
  END_TIME = DateTime.parse("11:59:59").to_time

  def self.mirror_times_for(angle)
    (START_TIME.to_i..END_TIME.to_i)
    .map{|t| Time.at(t).utc.strftime('%H:%M:%S') }
    .map{|time| time if ClockMirroring.new(time).mirror_angle == angle.to_f }
    .compact
  end

  def hour_angle
    (angle(:hour, 12) + angle(:minute, 720)) % 360
  end

  def minute_angle
    angle(:minute, 60) + angle(:second, 3600)
  end

  def mirror_angle
    (((minute_angle - hour_angle) / 2) + hour_angle).abs % 180
  end

  private

  def angle(value, segments)
    @time.send(value)/segments.to_f * 360
  end
end
