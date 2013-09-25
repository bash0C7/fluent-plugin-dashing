require 'spec_helper'

describe do
  let(:driver) {Fluent::Test::OutputTestDriver.new(Fluent::DashingOutput, 'test.metrics').configure(config)}
  let(:instance) {driver.instance}

  describe 'config' do
    let(:config) {
      %[
      dashing_url         http://localhost:3030/widgets/widget_id
      auth_token          YOUR_AUTH_TOKEN
      event_json_data_key current
      name_key            field1
      ]
    }
    
    context do
      subject {instance.dashing_url}
      it{should == 'http://localhost:3030/widgets/widget_id'}
    end

    context do
      subject {instance.auth_token}
      it{should == 'YOUR_AUTH_TOKEN'}
    end

    context do
      subject {instance.event_json_data_key}
      it{should == 'current'}
    end

    context do
      subject {instance.name_key}
      it{should == 'field1'}
    end

  end
  
  describe 'emit' do
    let(:record) {{ 'field1' => 50, 'otherfield' => 99}}
    let(:time) {0}
    let(:posted) {
      d = driver
      mock(HTTParty).post('http://localhost:3030/widgets/widget_id',
        :body => { auth_token: "YOUR_AUTH_TOKEN", current: '50' }.to_json)
      d.emit(record, Time.at(time))
      d.run
    }

    context do
      let(:config) {
        %[
      dashing_url         http://localhost:3030/widgets/widget_id
      auth_token          YOUR_AUTH_TOKEN
      event_json_data_key current
      name_key            field1
        ]
      }

      subject {posted}
      it{should_not be_nil}
    end

  end
end