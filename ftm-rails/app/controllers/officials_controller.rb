class OfficialsController < ApplicationController
  def new
    @official = Official.new

    @search = Search.new(input: input)
    @search.input = @search.input.gsub(/ /, '%20')

    src_url = "https://www.opensecrets.org/search/?q=#{@search.input}"
    src_html = open(src_url)
    raw_src = Nokogiri::HTML(src_html)
    @osid = raw_src.css('#main #member').at('a').attributes['href'].value.split('cid=')[1].split('&')[0]

    url = "https://www.opensecrets.org/politicians/summary.php?cid=#{osid}"
    html = open(url)
    raw_official = Nokogiri::HTML(html)

    @official.name = raw_official.css('#headInfo h1').text
    @official.state_id = State.find_by_abbreviation(raw_official.css('#headInfo #title').text.split(' ')[3][0..1]).id
    @official.district = 'At Large'
    @official.office = raw_official.css('#headInfo #title').text.split(' ')[0]
    @official.party_id = Party.find_by_abbreviation(raw_official.css('#headInfo #title').text.split(' ')[1][1]).id

    ## Rework to account for multiple officials with same name

    if !Official.find_by_name(@official.name)
      @official.save
      render json: @official, serializer: OfficialSerializer
    elsif Official.find_by_name(@official.name)
      @official = Official.find_by_name(@official.name)
      render json: @official, serializer: OfficialSerializer
    else
      render json: "There was an issue saving this official", status: 401
    end
  end
end
