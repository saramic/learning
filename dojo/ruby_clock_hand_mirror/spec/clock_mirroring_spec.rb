require 'clock_mirroring'

describe ClockMirroring do
  context 'should find all' do
    subject { ClockMirroring.mirror_times_for(0) }
    it { is_expected.to eql ['00:00:00', '00:55:25', '01:50:50',
                             '02:46:10', '03:41:35', '05:32:20',
                             '06:27:45', '07:23:05', '08:18:30',
                             '09:13:55', '10:09:15', '11:04:40'] }
  end

  context 'angle of mirror line' do
    [
      ['12:00', 0],
      ['1:00', 15],
      ['6:00', 90],
      ['00:00:00', 0],
      ['00:55:25', 0],
      ['01:50:50', 0],
      ['02:46:10', 0],
      ['3:45', 11.25],
      ['03:41:35', 0],
      ['05:32:20', 0],
      ['06:27:45', 0],
      ['07:23:05', 0],
      ['08:18:30', 0],
      ['09:13:55', 0],
      ['10:09:15', 0],
      ['11:04:40', 0]
    ].each do |(time, mirror_angle)|
      context "at #{time} hour hand will be #{mirror_angle}" do
        subject { ClockMirroring.new(time).mirror_angle }
        it { is_expected.to eq mirror_angle }
      end
    end
  end

  context 'angle' do
    [
      ['12:00', 0, 0],
      ['12:01', 0.5, 6],
      ['12:01:01', 0.5, 6.1],
      ['12:01:59', 0.5, 11.9],
      ['12:02:00', 1, 12],
      ['3:00', 90, 0],
      ['6:00', 180, 0],
      ['9:00', 270, 0],
      ['3:01', 90.5, 6],
      ['3:59', 119.5, 354],
      ['4:00', 120, 0]
    ].each do |(time, hour_angle, minute_angle)|
      context "at #{time} hour hand will be #{hour_angle}" do
        subject { ClockMirroring.new(time).hour_angle }
        it { is_expected.to eq hour_angle }
      end

      context "at #{time} minute hand will be #{minute_angle}" do
        subject { ClockMirroring.new(time).minute_angle }
        it { is_expected.to eq minute_angle }
      end
    end
  end
end
