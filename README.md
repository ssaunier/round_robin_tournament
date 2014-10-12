[![Build Status](https://travis-ci.org/ssaunier/round_robin_tournament.svg?branch=master)](https://travis-ci.org/ssaunier/round_robin_tournament)

# Round Robin Tournament

This little ruby gem implements the [Round Robin Tournament](http://en.wikipedia.org/wiki/Round-robin_tournament#Scheduling_algorithm) scheduling. It is useful when you want a competition
"in which each contestant meets all other contestants in turn", or if you have a classroom
of students and want them to work in pairs, but with a different partner every day.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'round_robin_tournament'
```

And then execute:

    $ bundle

## Usage

Call the method `RoundRobinTournament.schedule` with one argument,
an `Array` of size `n`. It will return an array of `n - 1` elements,
the days, and each element is an array of two elements, the game competitors.

If `n` is off, then the first element of each array element will be
an array of two element, the last one being `nil`.

## Example (`n` is even)

```ruby
require "round_robin_tournament"

# Compute all the possible teams for each day in the classroom
students = %w(John Paul Ringo George)
teams = RoundRobinTournament.schedule(students)

# Print for each day, each team
teams.each_with_index do |day, index|
  day_teams = day.map { |team| "(#{team.first}, #{team.last})" }.join(", ")
  puts "Day #{index + 1}: #{day_teams}"
end

# Day 1: (Paul, George), (Ringo, John)
# Day 2: (Ringo, George), (John, Paul)
# Day 3: (John, George), (Paul, Ringo)
```

## Example (`n` is odd)

```ruby
require "round_robin_tournament"

# Compute all the possible teams for each day in the classroom
students = %w(John Paul Ringo George OtherGuy)
teams = RoundRobinTournament.schedule(students)

# Print for each day, each team
teams.each_with_index do |day, index|
  day_teams = day.map { |team| "(#{team.first}, #{team.last})" }.join(", ")
  puts "Day #{index + 1}: #{day_teams}"
end

# Day 1: (Paul, ), (Ringo, John), (George, OtherGuy)
# Day 2: (Ringo, ), (George, Paul), (OtherGuy, John)
# Day 3: (George, ), (OtherGuy, Ringo), (John, Paul)
# Day 4: (OtherGuy, ), (John, George), (Paul, Ringo)
# Day 5: (John, ), (Paul, OtherGuy), (Ringo, George)
```