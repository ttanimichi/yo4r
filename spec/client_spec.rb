require 'spec_helper'

describe Yo::Client do
  describe '#yo' do
    context "with the valid api token" do
      subject { Yo::Client.new(api_token: ENV['YO_API_TOKEN']) }
      context "with the valid username" do
        it "returns true" do
          subject.yo(username: ENV['YO_USER_NAME']).should eq(true)
        end
      end

      context 'with an invalid username' do
        it 'raise Yo::ClientError' do
          ->{ subject.yo(username: 'invalid_user_name') }.should raise_error(Yo::ClientError)
        end
      end
    end

    context 'with an invalid api token' do
      subject { Yo::Client.new(api_token: 'invalid_api_token') }
      it 'raise Yo::ClientError' do
        ->{ subject.yo(username: ENV['YO_USER_NAME']) }.should raise_error(Yo::ClientError)
      end
    end

    context 'when Yo API server is down' do
      before  { Yo::HTTP.any_instance.stub(:yo).and_raise(Yo::UnknownError) }
      subject { Yo::Client.new(api_token: 'invalid_api_token') }
      it 'raise Yo::UnknownError' do
        ->{ subject.yo(username: ENV['YO_USER_NAME']) }.should raise_error(Yo::UnknownError)
      end
    end
  end

  describe '#yoall' do
    context 'with the valid api token' do
      subject { Yo::Client.new(api_token: ENV['YO_API_TOKEN']) }
      it "returns nil" do
        subject.yoall.should eq(nil)
      end
    end

    context 'with an invalid api token' do
      subject { Yo::Client.new(api_token: 'invalid_api_token') }
      it "returns nil" do
        subject.yoall.should eq(nil)
      end
    end

    context 'when Yo API server is down' do
      before  { Yo::HTTP.any_instance.stub(:yoall).and_raise(Yo::UnknownError) }
      subject { Yo::Client.new(api_token: 'invalid_api_token') }
      it 'raise Yo::UnknownError' do
        ->{ subject.yoall }.should raise_error(Yo::UnknownError)
      end
    end
  end

  describe '#subscribers_count' do
    context 'with the valid api token' do
      subject { Yo::Client.new(api_token: ENV['YO_API_TOKEN']) }
      it "returns Fixnum" do
        subject.subscribers_count.kind_of?(Fixnum).should eq(true)
      end
    end

    context 'with an invalid api token' do
      subject { Yo::Client.new(api_token: 'invalid_api_token') }
      it 'raise Yo::ClientError' do
        ->{ subject.subscribers_count }.should raise_error(Yo::ClientError)
      end
    end

    context 'when Yo API server is down' do
      before  { Yo::HTTP.any_instance.stub(:subscribers_count).and_raise(Yo::UnknownError) }
      subject { Yo::Client.new(api_token: ENV['YO_API_TOKEN']) }
      it 'raise Yo::UnknownError' do
        ->{ subject.subscribers_count }.should raise_error(Yo::UnknownError)
      end
    end
  end
end
