#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'pp'
require 'json'
require 'mechanize'
require 'pry'


def get_html(link)
  agent = Mechanize.new
  agent.get(link)
end

def get_rows_on_page(html)
  array = []
  rows = html.css('tr')
  rows.each do |row|
    if row.css('td')[1] != nil
      h = Hash[
      reg_number: row.css('td')[1].inner_html,
      reg_date: row.css('td')[2].inner_html,
      full_name: row.css('td')[3].inner_html.chomp.strip,
      address: row.css('td')[4].inner_html.chomp.strip,
      qualifications: row.css('td')[5].inner_html.chomp.strip,
      ]
    end
  array << h
  end
  array.compact
end

agent = get_html("http://example.com")
html = Nokogiri::HTML(agent.body)
pp array = get_rows_on_page(html)

