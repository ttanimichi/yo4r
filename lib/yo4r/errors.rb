module Yo
  YoError      = Class.new StandardError
  ClientError  = Class.new YoError
  UnknownError = Class.new YoError
end
