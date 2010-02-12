class AddBackgroundTransparentToXmlString < ActiveRecord::Migration
  def self.up
    for deck_detail in DeckDetail.all
      deck_detail.xml_string = deck_detail.xml_string.gsub(/(<backgroundColor [^>]*>)/, '\1<backgroundTransparent variable="false">false</backgroundTransparent>') # the destructive method gsub! doesn't work with rails' ActiveRecord
      deck_detail.save
    end
  end

  def self.down
    # not implemented
  end
end
