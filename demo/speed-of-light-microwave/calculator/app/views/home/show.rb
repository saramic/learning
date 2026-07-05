# frozen_string_literal: true

module Calculator
  module Views
    module Home
      class Show < Calculator::View
        GALLERY_PHOTOS = [
          {src: "/images/01_experiment_setup.jpg", caption: "Setup: turntable removed, chocolate ready to go in"},
          {src: "/images/02_the_test_team.jpg", caption: "The test team"},
          {src: "/images/04_early_melt_point.jpg", caption: "Fresh out of the microwave — an early melt point"},
          {src: "/images/03_show_melt_points.jpg", caption: "Two melt spots, ready to measure"},
          {src: "/images/05_measure_one.jpg", caption: "Measuring the spacing between spots"},
          {src: "/images/06_measeure_two.jpg", caption: "A second spacing measurement, for averaging"}
        ].freeze

        expose :gallery_photos do
          GALLERY_PHOTOS
        end

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
