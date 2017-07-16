require 'pit'
require 'spaceship'

class AdpService
  attr_reader :client
  def create_client(team)
    adp_login = ENV['ADP_LOGIN']
    if adp_login
      a = adp.split(':', 2)
      adp_login_user = a[0]
      adp_login_password = a[1]
    else
      adp_login_user = ENV['ADP_LOGIN_USER']
      adp_login_password = ENV['ADP_LOGIN_PASSWORD']
    end
    
    if adp_login_user == nil || adp_login_user == '' || adp_login_password == nil || adp_login_password == ''
      config = Pit.get('developer.apple.com', :require => {
        'email' => '',
        'password' => ''
      })
      adp_login_user = config['email']
      adp_login_password = config['password']
    end
    
    @client = Spaceship::Portal.login(adp_login_user, adp_login_password)
    
    if team
      @client.team_id = team
    else
      Spaceship::Portal.select_team
    end
    return @client
  end
end
