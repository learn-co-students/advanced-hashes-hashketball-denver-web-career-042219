require "pry"

def game_hash
    basketball = {
        :home=> {
            :team_name=>"Brooklyn Nets",
            :colors=>["Black", "White"],
            :players=> {
                "Alan Anderson"=> {
                    :number=> 0,
                    :shoe=> 16,
                    :points=> 22,
                    :rebounds=> 12,
                    :assists=> 12,
                    :steals=> 3,
                    :blocks=> 1,
                    :slam_dunks=> 1
                },
                "Reggie Evans"=> {
                    :number=> 30,
                    :shoe=> 14,
                    :points=> 12,
                    :rebounds=> 12,
                    :assists=> 12,
                    :steals=> 12,
                    :blocks=> 12,
                    :slam_dunks=> 7
                },
                "Brook Lopez"=> {
                    :number=> 11,
                    :shoe=> 17,
                    :points=> 17,
                    :rebounds=> 19,
                    :assists=> 10,
                    :steals=> 3,
                    :blocks=> 1,
                    :slam_dunks=> 15
                },
                "Mason Plumlee"=> {
                    :number=> 1,
                    :shoe=> 19,
                    :points=> 26,
                    :rebounds=> 12,
                    :assists=> 6,
                    :steals=> 3,
                    :blocks=> 8,
                    :slam_dunks=> 5
                },
                "Jason Terry"=> {
                    :number=> 31,
                    :shoe=> 15,
                    :points=> 19,
                    :rebounds=> 2,
                    :assists=> 2,
                    :steals=> 4,
                    :blocks=> 11,
                    :slam_dunks=> 1,
                }
            }

        },
        :away=> {
            :team_name=> "Charlotte Hornets",
            :colors=> ["Turquoise", "Purple"],
            :players=> {
                "Jeff Adrien"=> {
                    :number=> 4,
                    :shoe=> 18,
                    :points=> 10,
                    :rebounds=> 1,
                    :assists=> 1,
                    :steals=> 2,
                    :blocks=> 7,
                    :slam_dunks=> 2
                },
                "Bismak Biyombo"=> {
                    :number=> 0,
                    :shoe=> 16,
                    :points=> 12,
                    :rebounds=> 4,
                    :assists=> 7,
                    :steals=> 7,
                    :blocks=> 15,
                    :slam_dunks=> 10
                },
                "DeSagna Diop"=> {
                    :number=> 2,
                    :shoe=> 14,
                    :points=> 24,
                    :rebounds=> 12,
                    :assists=> 12,
                    :steals=> 4,
                    :blocks=> 5,
                    :slam_dunks=> 5
                },
                "Ben Gordon"=> {
                    :number=> 8,
                    :shoe=> 15,
                    :points=> 33,
                    :rebounds=> 3,
                    :assists=> 2,
                    :steals=> 1,
                    :blocks=> 1,
                    :slam_dunks=> 0
                },
                "Brendan Haywood"=> {
                    :number=> 33,
                    :shoe=> 15,
                    :points=> 6,
                    :rebounds=> 12,
                    :assists=> 12,
                    :steals=> 22,
                    :blocks=> 5,
                    :slam_dunks=> 12
                }

            }
        }
    }
end

def players 
# home_players = game_hash[:home][:players]
# away_players = game_hash[:away][:players]
# all_players = home_players.merge away_players
# game_hash[:home][:players].merge game_hash[:away][:players] combines top 3 lines
players = {}
game_hash .each do |location, team_data|
  players = players.merge team_data[:players]
  end
  players
end

def num_points_scored(player_name)
  points = players[player_name][:points]
end

def shoe_size(player_name)
  size = players[player_name][:shoe]
end

def teams 
  teams = {}
  game_hash.each do |location, team_data|
    teams[team_data[:team_name]]  = team_data
  end
  teams
end

def team_colors (team_name)
  teams[team_name][:colors]
end

def team_names
  teams.keys
#   team_names = []
  
#   teams.each do |team_name, team_data|
#     team_names << team_name
#   end

# team_name
end

def player_numbers (team_name)
  players = teams[team_name][:players]
  
  players.map do |player_name, player_data|
    player_data[:number]
  end
  
  # player_numbers = []
  
  # players.each do |player_name, player_data|
  #   player_numbers << player_data[:number]
  # end
end

def player_stats (player_name)
  players[player_name]
end

def big_shoe_rebounds
  big_shoe_player = players.max_by do |player_name, player_data|
     player_data[:shoe]
  end
   rebounds = big_shoe_player[1][:rebounds]
end