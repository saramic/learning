# frozen_string_literal: true

module Calculator
  module Views
    module Gallery
      class Show < Calculator::View
        PHOTOS = [
          {id: "photo-1", src: "/images/01_experiment_setup.jpg", caption: "Setup: turntable removed, chocolate ready to go in"},
          {id: "photo-2", src: "/images/02_the_test_team.jpg", caption: "The test team"},
          {id: "photo-3", src: "/images/04_early_melt_point.jpg", caption: "Fresh out of the microwave — an early melt point"},
          {id: "photo-4", src: "/images/03_show_melt_points.jpg", caption: "Two melt spots, ready to measure"},
          {id: "photo-5", src: "/images/05_measure_one.jpg", caption: "Measuring the spacing between spots"},
          {id: "photo-6", src: "/images/06_measeure_two.jpg", caption: "A second spacing measurement, for averaging"}
        ].freeze

        expose :photos do
          PHOTOS
        end
      end
    end
  end
end
