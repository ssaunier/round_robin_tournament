require 'round_robin_tournament/version'

module RoundRobinTournament

  def self.schedule(array)
    array.push(nil) if array.size.odd?
    n = array.size
    1.step(n / 2, 1).each do |i|
      array.insert(n - i, array.delete_at(i))
    end
    pivot = array.pop
    games = (n - 1).times.map do
      day = [[array.first, pivot]] + (1...(n / 2)).map { |j| [array[j], array[n - 1 - j]] }
      array.rotate!
      day
    end
    array.push pivot unless pivot.nil?
    games
  end

end
