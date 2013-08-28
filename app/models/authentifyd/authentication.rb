class Authentifyd::Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id
  belongs_to :user
  
  def displayable_name
    displayable_names(provider).try(:capitalize)
  end
  
  def displayable_names(provder)
    case provder
    when 'google_oauth2' then 'google'
    else
      provder
    end
  end
end