require 'active_support/concern'
require 'uri'

module GoogleApi
  def encode_polyline(polyline_data)
    url = 'https://maps.googleapis.com/maps/api/staticmap?'
    # center, zoom not required with polyline
    size = '400x400'# pixels_wide x pixels_high
    sensor = 'false'
    # format = # optional, default is png
    # path = # pathstyles|enc:#{polyline_data}
    path = "enc:#{polyline_data}"
    key = ENV['GOOGLEAPI']

    URI.escape(url + "size=#{size}&sensor=#{sensor}&path=#{path}&key=#{key}")
  end
end
