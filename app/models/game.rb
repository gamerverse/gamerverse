class Game < ApplicationRecord
  def getCoverArtUrl
    return coverart
  end
  
  def getTitle
    return title
  end
end
