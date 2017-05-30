require 'open-uri'

class CandidatesController < ApplicationController
  def create
    candidate = Candidate.new
    url = 'https://www.opensecrets.org/politicians/summary.php?cid=N00001003'
    html = open(url)
    raw_candidate = Nokogiri::HTML(html)

    byebug

    candidate.name = 'Boberto I'
    candidate.state = 5
    candidate.district = 'At Large'
    candidate.office = 'Emperor'
    candidate.party = 1
    if candidate.save
      render json: candidate, serializer: CandidateSerializer
    else
      render json: "There was an issue saving this candidate", status: 401
    end
  end
end
