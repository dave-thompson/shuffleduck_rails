class ChangeFontToArialmt < ActiveRecord::Migration
  def self.up
    for deck_detail in DeckDetail.all
      # change background transparencies to true
      deck_detail.xml_string = deck_detail.xml_string.gsub('Arial','ArialMT')
      deck_detail.save
    end
  end

  def self.down
    # not implemented
  end
end
