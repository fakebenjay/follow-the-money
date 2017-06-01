class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
    url = 'https://www.opensecrets.org/politicians/summary.php?cid=N00001003'
    html = open(url)
    raw_candidate = Nokogiri::HTML(html)

    @candidate.name = raw_candidate.css('#headInfo h1').text
    @candidate.state_id = State.find_by_abbreviation(raw_candidate.css('#headInfo #title').text.split(' ')[3][0..1]).id
    @candidate.district = 'At Large'
    @candidate.office = raw_candidate.css('#headInfo #title').text.split(' ')[0]
    @candidate.party_id = Party.find_by_abbreviation(raw_candidate.css('#headInfo #title').text.split(' ')[1][1]).id
    byebug
    if !Candidate.find_by_name(@candidate.name)
      @candidate.save
      render json: @candidate, serializer: CandidateSerializer
    elsif Candidate.find_by_name(@candidate.name)
      render json: @candidate, serializer: CandidateSerializer
    else
      render json: "There was an issue saving this candidate", status: 401
    end
  end
end
