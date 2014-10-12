require 'round_robin_tournament/version'

module RoundRobinTournament

  def self.schedule(array)
    array.push nil if array.size.odd?
    n = array.size
    pivot = array.pop
    games = (n - 1).times.map do
      array.rotate!
      [[array.first, pivot]] + (1...(n / 2)).map { |j| [array[j], array[n - 1 - j]] }
    end
    array.push pivot unless pivot.nil?
    games
  end

end
