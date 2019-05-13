# Write your code here!
require "pry"

def game_hash
  game = { 
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
      "Bismack Biyombo" => {
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

def num_points_scored(playerName)
  pointsReturn = 0
  game_hash.each{|location,teamData|
    teamData.each{|attribute,data|
      if attribute==:players
      data.each{|name,stats|
        if name==playerName
          stats.each{|x,y|
            if x==:points
              pointsReturn=y
            end
          }
        end
          }
        end
        }
      }
pointsReturn
end

def shoe_size(playerName)
  sizeReturn = 0
  game_hash.each{|location,teamData|
    teamData.each{|attribute,data|
      if attribute==:players
      data.each{|name,stats|
        if name==playerName
          stats.each{|x,y|
            if x==:shoe
              sizeReturn=y
            end
          }
        end
          }
        end
        }
      }
sizeReturn
end

def team_colors(teamName)
  colorArray =[]
  game_hash.each{|location,teamData|
    if teamData.values.any?{|team| team==teamName}
    teamData.each {|attribute,data|
      if attribute==:colors
        colorArray=data
      end
    }
  end
  }
colorArray
end

def team_names
  teamReturn =[]
  game_hash.each{|location,teamData|
    teamData.each{|attribute,data|
    if attribute==:team_name
      teamReturn << data
    end
    }
  }
teamReturn
end

def player_numbers(teamName)
arrayReturn=[]
  game_hash.each{|location,teamData|
    if teamData.values.any?{|team| team==teamName}
      teamData.each{|attribute,data|
        if attribute==:players
          data.each{|name,stats|
            stats.each{|x,y|
              if x==:number
                arrayReturn << y  
              end
            }
          }
        end
      }
    end
  }
arrayReturn
end

def player_stats(playerName)
statsReturn = {}
  game_hash.each{|location,teamData|
    teamData.each{|attribute,data|
      if attribute==:players
      data.each{|name,stats|
        if name==playerName
          statsReturn=stats
        end
          }
        end
        }
      }
statsReturn
end

def big_shoe_rebounds
  shoeSize = []
  rebounds = []
  game_hash.each{|location,teamData|
    teamData.each{|attribute,data|
      if attribute==:players
      data.each{|name,stats|
        stats.each{|x,y|
          if x==:shoe
          shoeSize << y
          elsif x==:rebounds
          rebounds << y
          end
          }
        }
        end
        }
      }
rebounds[shoeSize.index(shoeSize.max)]
binding.pry
end


