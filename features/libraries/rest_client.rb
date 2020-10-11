#! usr/bin/ruby
require 'uri'
require 'json'
require 'rest-client'


class HttpClient

  def get(url, headers)
    begin
      response = RestClient::Request.execute(
          :url => url,
          :headers => headers,
          :method => :get,
          :verify_ssl => false
      )
    rescue RestClient::ExceptionWithResponse => err
      case err.http_code
      when 301, 302, 307
        puts "301,302,307"
        # puts err.response.follow_redirection
      when 400,401,409,422
        # puts err.response
        puts "400,401,409,422"
        return err.response
      else
        raise
      end
    end
    return response
  end


  def post(url, payload, headers)
    begin
      response = RestClient::Request.execute(
          :url => url,
          :headers => headers,
          :payload => payload,
          :method => :post,
          :verify_ssl => false
      )

    rescue RestClient::ExceptionWithResponse => err
      case err.http_code
      when 301, 302, 307
        # puts err.response.follow_redirection
        puts "301,302,307"
      when 400
        return err.response
      else
        raise
      end
    end
    return response
  end


  def put(url, payload, headers)
    begin
      response = RestClient::Request.execute(
          :url => url,
          :headers => headers,
          :payload => payload,
          :method => :put,
          :verify_ssl => false
      )
    rescue RestClient::ExceptionWithResponse => err
      case err.http_code
      when 301, 302, 307
        puts "301,302,307"
        # puts err.response.follow_redirection
      when 400,401,409
        return err.response
      else
        raise
      end
    end
    return response
  end

  def delete(url, headers)
    begin
      response = RestClient::Request.execute(
          :url => url,
          :headers => headers,
          :payload => '',
          :method => :delete,
          :verify_ssl => false
      )
    rescue RestClient::ExceptionWithResponse => err
      case err.http_code
      when 301, 302, 307
        puts "301,302,307"
        # puts err.response.follow_redirection
      when 400
        return err.response
        # puts "400 bad request"
      else
        raise
      end
    end
    return response
  end

  def patch (url, payload, headers)
    begin
      response = RestClient::Request.execute(
          :url => url,
          :headers => headers,
          :payload => payload,
          :method => :patch,
          :verify_ssl => false
      )
    rescue RestClient::ExceptionWithResponse => err
      case err.http_code
      when 301, 302, 307
        puts "301,302,307"
        # puts err.response.follow_redirection
      when 400,401,409
        return err.response
      else
        raise
      end
    end
    return response
  end

end


