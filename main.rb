#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'slim'
require 'rest-client'
require 'json'
require_relative 'inc/api'
require_relative 'inc/mail'
require_relative 'inc/pagevars'

helpers do
  def login?
    return false
  end
end

get '/' do
  @PageTitle = 'Home'
  @TRAVISBUILDNUMBER = Pagevars.setVars("CIbuild")
  slim :home
end

get '/api' do
  API.a()
end
get '/api/mail/validate' do
  API.mailvalidate(:params['m'])
end
