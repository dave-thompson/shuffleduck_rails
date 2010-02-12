class AddBackgroundColorToSide < ActiveRecord::Migration
  def self.up
    for deck_detail in DeckDetail.all
      deck_detail.xml_string = deck_detail.xml_string.gsub(/(<Side>)/,'<Side backgroundColor="0">')
      deck_detail.save
    end
  end

  def self.down
    # not implemented
  end
end
