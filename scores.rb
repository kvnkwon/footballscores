
team_scores = {
  1 => {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 7,
    away_score: 3,
  },
  2 => {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 3,
    away_score: 0
  },
  3 => {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 11,
    away_score: 7
  },
  4 => {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 21
  }
}

score_count = {
  "Patriots" => [0, 0],
  "Colts" => [0, 0],
  "Steelers" => [0, 0],
  "Broncos" => [0, 0]
}


team_scores.each do |number, game|
  if game[:home_score] > game[:away_score]
    winner = game[:home_team]
    score_count[winner][0] += 1
    loser = game[:away_team]
    score_count[loser][1] += 1
  else
    winner = game[:away_team]
    score_count[winner][0] += 1
    loser = game[:home_team]
    score_count[loser][1] += 1
  end
end

score_counts = score_count.sort_by {|team,record| [team,record]}

score_counts.sort do |team1,team2|
  team2[1][0] <=> team1[1][0]
end

score_counts.each do |team|
  puts "Team: #{team[0]},   Win(s): #{team[1][0]},   Loss(es): #{team[1][1]}"
end
