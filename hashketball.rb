# Write your code here!
require 'pry'

def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  }
}
end

# there has to be a better way to do this
#how do I use pry?  kept me in a loop
def num_points_scored(player_name)
  if !game_hash.keys.include?(:players)
    game_hash.each  do |location, team_info|
      if team_info.keys.include?(:players)
        team_info.each do |attribute, quanity|
          if attribute == :players
            quanity.each do |name, stats|
              if name == player_name
                stats.each do |stat, quanity|
                  if stat == :points
                    return quanity
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end



def shoe_size(player_name)
  if !game_hash.keys.include?(:players)
    game_hash.each  do |location, team_info|
      if team_info.keys.include?(:players)
        team_info.each do |attribute, quanity|
          if attribute == :players
            quanity.each do |name, stats|
              if name == player_name
                stats.each do |stat, quanity|
                  if stat == :shoe
                    return quanity
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end


def team_colors(team_name)
  if !game_hash.keys.include?(:team_name)
    game_hash.each  do |location, team_info|
      if team_info.keys.include?(:team_name)
        team_info.each do |attribute, quanity|
          if quanity == team_name
            return team_info[:colors]
          end
        end
      end
    end
  end
end


def team_names
  teams = Array.new
  if !game_hash.keys.include?(:team_name)
    game_hash.each  do |location, team_info|
      puts team_info[:team_name]
      teams << team_info[:team_name]
    end
  end
  return teams
end


## there has to be another way to do this, these are insane

def player_numbers(team_name)
  jersey_numbers = Array.new

  if !game_hash.keys.include?(:team_name)
    game_hash.each  do |location, team_info|
      if team_info.keys.include?(:team_name)
        team_info.each do |attribute, quanity|
          if quanity == team_name
            team_info.each do |attribute, quanity|
              if attribute == :players
            #    binding.pry
                quanity.each do |name, stats|
                  if name.length > 0
              #    binding.pry
                    stats.each do |stat, stat_quanity|
                      if stat == :number
                    #    binding.pry
                        jersey_numbers << stat_quanity
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
puts  jersey_numbers
return jersey_numbers
end



def player_stats(player_name)
    if !game_hash.keys.include?(:players)
      game_hash.each  do |location, team_info|
        if team_info.keys.include?(:players)
          team_info.each do |attribute, quanity|
            if attribute == :players
              quanity.each do |name, stats|
                if name == player_name
                  puts stats
                  return stats
                end
              end
            end
          end
        end
      end
    end
end


#need to creare a method that returns the number of rebounds for the player with the largest show size
# I ofund the dig method but i think it only does the home team
def big_shoe_rebounds_2

highest_rebounds = 0
biggest_shoe = 0


  game_hash.dig(:home, :players).each do |player_name, stats|
    stats.each do |stat, number|
      if stat == :shoe
        if number > biggest_shoe
          biggest_shoe = number
          stats.each do |stat, number|
            if stat == :rebounds
              highest_rebounds = number

            end
          end
      end
    end
  end
end

  puts highest_rebounds
  return highest_rebounds
end



# i rebuild this one and its gnarly but it works
def big_shoe_rebounds

highest_rebounds = 0
biggest_shoe = 0

  game_hash.each do |location, team_info|
    game_hash.dig(location, :players).each do |player_name, stats|
      stats.each do |stat, number|
        if stat == :shoe
          if number > biggest_shoe
            biggest_shoe = number
            stats.each do |stat, number|
              if stat == :rebounds
                highest_rebounds = number
              end
            end
          end
        end
      end
    end
  end
  puts highest_rebounds
  return highest_rebounds
end


player_numbers("Brooklyn Nets")

team_colors("Charlotte Hornets")

# game_hash[:home][:players]["Alan Anderson"][:points]
