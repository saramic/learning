# frozen_string_literal: true

module Calculator
  # Computes c = f × λ from a microwave standing-wave hot-spot measurement.
  #
  # The measured distance spans `gap_count` half-wavelengths (adjacent melt
  # spots are λ/2 apart), so the wavelength is `2 * (distance / gap_count)`.
  module SpeedOfLight
    ACCEPTED_C_MS = 299_792_458.0

    Result = Struct.new(
      :frequency_mhz,
      :spot_distance_cm,
      :gap_count,
      :avg_spacing_cm,
      :wavelength_cm,
      :speed_of_light_ms,
      :percent_error,
      keyword_init: true
    )

    def self.calculate(frequency_mhz:, spot_distance_cm:, gap_count:)
      frequency_mhz = Float(frequency_mhz)
      spot_distance_cm = Float(spot_distance_cm)
      gap_count = Integer(gap_count)

      raise ArgumentError, "frequency must be positive" unless frequency_mhz.positive?
      raise ArgumentError, "distance must be positive" unless spot_distance_cm.positive?
      raise ArgumentError, "gap count must be at least 1" unless gap_count >= 1

      avg_spacing_cm = spot_distance_cm / gap_count
      wavelength_cm = avg_spacing_cm * 2
      speed_of_light_ms = (frequency_mhz * 1_000_000) * (wavelength_cm / 100.0)
      percent_error = ((speed_of_light_ms - ACCEPTED_C_MS).abs / ACCEPTED_C_MS) * 100

      Result.new(
        frequency_mhz: frequency_mhz,
        spot_distance_cm: spot_distance_cm,
        gap_count: gap_count,
        avg_spacing_cm: avg_spacing_cm,
        wavelength_cm: wavelength_cm,
        speed_of_light_ms: speed_of_light_ms,
        percent_error: percent_error
      )
    end
  end
end
