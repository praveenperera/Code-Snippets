#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'json'
require 'mechanize'


SCRAPE_URL = ARGV[0]

def start_mechanize(link)
  agent = Mechanize.new
  agent.get(link)
end

def get_html(page)
  Nokogiri::HTML(page.body)
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
      scraped: true,
      section: 'ACT15'
      ]
    end
  array << h
  end
  array.compact
end

def get_page(url,page)
  html = get_html(page)
  get_rows_on_page(html)
end

def get_next_page(page)
  next_page = page.link_with(:dom_id => 'next').click
  html = get_html(next_page)
  get_rows_on_page(html)
end

def last_page?(page)
  !page.link_with(:dom_id => 'next')
end

page = start_mechanize(SCRAPE_URL)
array = get_page(SCRAPE_URL, page)

loop do
  array << get_next_page(page)
  page = page.link_with(:dom_id => 'next').click
  break if last_page?(page)
end

File.open("act15.json","w") do |f|
  f.write(JSON.pretty_generate(array.flatten))
end

