# frozen_string_literal: true

module Calculator
  module Views
    module Home
      class Show < Calculator::View
        expose :frequency_mhz, default: "2450"
        expose :spot_distance_cm, default: ""
        expose :gap_count, default: "1"

        expose :calculation do |frequency_mhz: "2450", spot_distance_cm: nil, gap_count: "1", **|
          next nil if spot_distance_cm.to_s.strip.empty?

          begin
            Calculator::SpeedOfLight.calculate(
              frequency_mhz: frequency_mhz,
              spot_distance_cm: spot_distance_cm,
              gap_count: gap_count
            )
          rescue ArgumentError, TypeError
            nil
          end
        end

        expose :error_message do |calculation, spot_distance_cm: nil, **|
          "Please enter valid positive numbers for frequency, distance, and gap count." if
            !spot_distance_cm.to_s.strip.empty? && calculation.nil?
        end
      end
    end
  end
end
