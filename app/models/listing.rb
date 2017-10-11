# == Schema Information
#
# Table name: listings
#
#  id                 :integer          not null, primary key
#  title              :string
#  street_address     :string
#  city               :string
#  country_code       :string
#  bed_count          :integer
#  bedroom_count      :integer
#  bathroom_count     :integer
#  description        :text
#  night_fee_cents    :integer
#  cleaning_fee_cents :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  host_id            :integer
#

class Listing < ApplicationRecord
    geocoded_by :full_address
    after_validation :geocode
    
    def country
        ISO3166::Country.new(country_code.upcase)
    end

    def full_address
        # [street_address, city, country.name].join(', ')
        "#{street_address}, #{city}, #{country.name}"
    end
end
