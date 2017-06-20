class OfficialsController < ApplicationController
  def new
    @official = Official.new
    url = 'https://www.opensecrets.org/politicians/summary.php?cid=N00001003'
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
