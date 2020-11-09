class Tournament
  attr_reader :teams

  def initialize(results)
    (*team_names, result) = results.strip.split(';')
    @teams = team_names.map{|team_name| Team.new(team_name) }

    winner = {match_played: 1, won: 1, points: 3}
    looser = {match_played: 1, lost: 1, points: 0}

    if result == "win"
      @teams[0].assign_points(winner)
      @teams[1].assign_points(looser)
    elsif result == "loss"
      @teams[0].assign_points(looser)
      @teams[1].assign_points(winner)
    end
  end

  def self.tally(results)
    tournament = Tournament.new(results)
    ScoreBoard.new(tournament).display
  end
end

class ScoreBoard
  def initialize(tournament)
    @teams = tournament.teams
  end

  def display
    headers + 
    @teams
      .sort_by { |team| team.points }
      .reverse
      .map do |team|
        team_score(team)
      end.join
  end

  private

  def headers
    display_line("Team", "MP",  "W", "D", "L", "P")
  end

  def team_score(team)
    display_line(team.name, team.match_played, team.won,  team.drawn, team.lost, team.points)
  end

  def display_line(*args)
    format("%-31s| %2s | %2s | %2s | %2s | %2s\n", *args)
  end
end

class Team
  attr_accessor :match_played, :won, :drawn, :lost, :points
  attr_reader :name

  def initialize(name)
    @name = name
    @match_played = 0
    @won = 0
    @drawn = 0
    @lost = 0
    @points = 0
  end

  def assign_points(match_played: 0, won: 0, drawn: 0, lost: 0, points: 0)
    @match_played += match_played
    @won += won
    @drawn += drawn
    @lost += lost
    @points += points
  end
end