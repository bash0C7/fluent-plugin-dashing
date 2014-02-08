# fluent-plugin-dashing, a plugin for [Fluentd](http://fluentd.org)

## DashingOutput

Plugin to output data(number, text, etc...) to 'Dashing', dashboard framework over HTTP.

About Dashing, see:

- Web site: http://shopify.github.io/dashing/
- Github: https://github.com/Shopify/dashing
- Demo: http://dashingdemo.herokuapp.com/sample

### Configure

````
<store>
  type dashing
  dashing_url         http://localhost:3030/widgets/widget_id
  auth_token          MY_AUTH_TOKEN
  event_json_data_key current
  name_key            field1
</store>
````

- dashing_url
 - Your Dashing API URL
 - see: http://shopify.github.io/dashing/#data -> API
- auth_token
 - Your Dashing auth_token (which can be found in config.ru)
 - see: http://shopify.github.io/dashing/#data -> API
- event_json_data_key
 - data key in post data (json format) 
- name_key

#### example

For messages such as: {"field1":300, "field2":20, "field3diff":-30}
Send 'field1' value to http://localhost:3030/widgets/widget_id (see: http://shopify.github.io/dashing/#data -> API)

Post '{ "auth_token": MY_AUTH_TOKEN, "current": 300 }' to http://localhost:3030/widgets/widget_id

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## releases

- 2013/09/26 0.0.0 1st release
