class TestController < ApplicationController
skip_before_action :verify_authenticity_token

def index

response = RestClient::Request.execute(
   :method => :get,
   :url => 'https://api.xively.com/v2/feeds/819176661/datastreams/PM25count.json',
   :headers => {"X-ApiKey" => "yGnWbZJJWfKB5sIImNO7xRXRA6KFUlUJH1hYWsPs065Q6fYX"}
)

responsejson = JSON.parse(response)

pm25count = responsejson['current_value']

t = Tropo::Generator.new
t.say(:value => "The current PM 2 point 5 count is" + pm25count + "particles per cubic foot", :voice => "allison")
render :json => t.response
end

end

value: ""