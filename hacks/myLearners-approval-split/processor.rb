#!/usr/bin/env ruby
# frozen_string_literal: true

require 'JSON'
require 'base64'
require 'nokogiri'

doc = File.open('data/all_learners_drive_data') { |file| Nokogiri::XML(file) }
out = []

doc.xpath('//response').map do |request|
  text = request.children.first.text
  JSON.parse(Base64.decode64(text).split("\n\r")[1])['trips'].map do |trip|
    # trip
    # {
    #   "learnerDriver"=> {
    #     "userId"=>"2XXXXXXX-XXXX-4XXX-XXXX-1XXXXXXXXXXX@vrciamb2cindprd.onmicrosoft.com",
    #     "firstName"=>"Felix",
    #     "lastName"=>"Milewski",
    #     "driverType"=>"Learner"
    #   },
    #   "tripId"=>12395272,
    #   "distance"=>0,
    #   "totalDuration"=>0,
    #   "nightDuration"=>0,
    #   "startDateUtc"=>"2021-04-05T07:58:11.41Z",
    #   "endDateUtc"=>"2021-04-05T07:58:17.043Z",
    #   "createdOnDateUtc"=>"2021-04-05T08:10:47.32Z",
    #   "status"=>"Rejected",
    #   "verifiedDateUtc"=>"2021-04-05T08:11:15.01Z",
    #   "isAbnormal"=>false,
    #   "isVerified"=>true,
    #   "icon"=>"static/icons/list_day.png",
    #   "isManualTrip"=>false,
    #   "alerts"=>nil
    # }
    out << {
      name: trip.dig('learnerDriver', 'firstName'),
      trip_id: trip['tripId'],
      distance: trip['distance'],
      totalDuration: trip['totalDuration'],
      nightDuration: trip['nightDuration'],
      status: trip['status'],
      isVerifired: trip['isVerifired']
    }
  end
end

verified_trips = out.select do |trip|
  trip[:status] == 'Approved'
end

total_duration = verified_trips.map do |trip|
  trip.slice(:name, :totalDuration)
end

total_duration_by_name = total_duration.group_by do |trip|
  trip[:name]
end

totals = total_duration_by_name.transform_values do |trips|
  trips.sum { |trip| trip[:totalDuration] / 60.0 }
end

puts totals.to_json
# {"Felix":96.1,"Matilda":35.0}
