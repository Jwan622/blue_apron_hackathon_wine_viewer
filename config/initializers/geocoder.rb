Geocoder.configure(
  # geocoding service (see below for supported options):
  :lookup => :bing,
  # IP address geocoding service (see below for supported options):
  :ip_lookup => :maxmind,
  # to use an API key:
  :api_key => "8zzLbYOWLzXNCzc69OhF~YIfgOM3jSbpSP_IUG-B4Mw~Aq78i5uADiRYvDa-o570jJ-cetnaGD6cYk0RtIE28tAOvmePIH4WwleYpdflV7Yj",
  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,
  # set default units to kilometers:
  :units => :km,
  # caching (see below for details):
  :cache => Redis.new,
  :cache_prefix => ""
)
