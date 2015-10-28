class TestController < ApplicationController
skip_before_action :verify_authenticity_token

def index

response = RestClient::Request.execute(
   :method => :get,
   :url => 'https://api.xively.com/v2/feeds/819176661/datastreams/PM10count.json',
   :headers => {"X-ApiKey" => "yGnWbZJJWfKB5sIImNO7xRXRA6KFUlUJH1hYWsPs065Q6fYX"}
)

responsejson = JSON.parse(response)

pm10count = responsejson['current_value']

t = Tropo::Generator.new
t.say(:value => "The current PM10 count is" + pm10count + "particles per cubic foot")
render :json => t.response
end

end
