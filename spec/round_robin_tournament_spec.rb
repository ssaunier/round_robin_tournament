require 'spec_helper'

describe RoundRobinTournament do
  it 'has a version number' do
    expect(RoundRobinTournament::VERSION).not_to be nil
  end

  describe '#schedule' do
    (2..20).to_a.each do |n|
      it "is correct for #{n} numbers" do
        schedule = RoundRobinTournament.schedule((1..n).to_a)
        expect { check_schedule!(schedule) }.not_to raise_error
      end
    end

    it 'works with array of any stuff' do
      Student = Struct.new(:name)
      students = %w(John Paul Ringo George).map { |beatle| Student.new beatle }

      teams = RoundRobinTournament.schedule(students)
      expect { check_schedule!(teams) }.not_to raise_error
    end

    (2..20).to_a.each do |n|
      it "is stable growing the number of participants from #{n} to #{n + 1}" do
        day_one = RoundRobinTournament.schedule(("a".."z").to_a.take(n)).first
        participants_day_two = ("a".."z").to_a.take(n + 1)
        participants_day_two_last = participants_day_two.last
        day_two = RoundRobinTournament.schedule(participants_day_two).first

        if n.even?
          day_two = day_two.reject { |pair| pair.compact.size != 2 }
        else
          day_one = day_one.map { |pair| pair.map { |participant| participant.nil? ? participants_day_two_last : participant } }
        end
        expect(day_two).to eq(day_one)
      end
    end
  end

  def check_schedule!(schedule)
    schedule.each_with_index do |games, day|
      games.each_with_index do |game, game_id|
        schedule.each_with_index do |other_games, other_day|
          next if day == other_day
          other_games.each_with_index do |other_game, other_game_id|
            fail if game_id != other_game_id && same_game?(game, other_game)
          end
        end
      end
    end
  end

  def same_game?(game, other_game)
    (game.first == other_game.first && game.last == other_game.last) ||
      (game.last == other_game.first && game.first == other_game.last)
  end
end
