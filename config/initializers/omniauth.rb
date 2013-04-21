# load facebook credentials
facebook_config = Rails.root.to_s + "/config/services/facebook.yml.erb"
if File.exist?(facebook_config)
  facebook_apps = File.read(facebook_config)
  FACEBOOK = YAML.load(ERB.new(facebook_apps).result)[Rails.env].symbolize_keys
end

twitter_config = Rails.root.to_s + "/config/services/twitter.yml.erb"
if File.exist?(twitter_config)
  twitter_apps = File.read(twitter_config)
  TWITTER = YAML.load(ERB.new(twitter_apps).result)[Rails.env].symbolize_keys
end

google_config = Rails.root.to_s + "/config/services/google.yml.erb"
if File.exist?(google_config)
  google_apps = File.read(google_config)
  GOOGLE = YAML.load(ERB.new(google_apps).result)[Rails.env].symbolize_keys
end

Rails.application.config.middleware.use OmniAuth::Builder do
  if defined?(TWITTER)
    provider :twitter, TWITTER[:app_id], TWITTER[:app_secret],
      :callback_path => Authentifyd.embeddable_callback_path("/auth/twitter/callback")
  end
  if defined?(GOOGLE)
    provider :google_oauth2, GOOGLE[:app_id], GOOGLE[:app_secret],
      :callback_path => Authentifyd.embeddable_callback_path("/auth/google_oauth2/callback"),
      :scope => "userinfo.email,userinfo.profile,plus.me"
  end
  if defined?(FACEBOOK)
    provider :facebook, FACEBOOK[:app_id], FACEBOOK[:app_secret],
      :callback_path => Authentifyd.embeddable_callback_path("/auth/facebook/callback"),
      :scope => "user_about_me,email"
                # ( %w(email) + 
                #(Authentifyd.omniauth_config.try(:[], :facebook).try(:[], :scope) || [])
                # ).join(',')
        #       
        # #
        # # User and Friends Permissions
        # # ############################
        # #
        # # all following permissions can be asked for friends too
        # "user_about_me",
        # # friends_about_me,
        # "user_activities",
        # # friends_activities,
        # "user_birthday",
        # # friends_birthday,
        # # user_checkins,
        # # friends_checkins,
        # # user_education_history,
        # # friends_education_history
        # "user_events",
        # # friends_events,
        # "user_groups",
        # # friends_groups,
        # "user_hometown",
        # # friends_hometown,
        # "user_interests",
        # # friends_interests
        # "user_likes",
        # "friends_likes",
        # "user_location",
        # "friends_location",
        # # user_notes,
        # # friends_notes,
        # # user_photos,
        # # friends_photos,
        # # user_questions,
        # # friends_questions,
        # "user_relationships",
        # "friends_relationships",
        # "user_relationship_details",
        # "friends_relationship_details",
        # "user_religion_politics",
        # "friends_religion_politics",
        # "user_status",
        # "friends_status",
        # "user_videos",
        # "friends_videos",
        # "user_website",
        # "friends_website",
        # "user_work_history",
        # "friends_work_history",
        # "email",
        # #
        # # Extended Permissions # optional for sign up  - user can sign up while saying no
        # # ####################
        # #
        # "read_friendlists",
        # # read_insights,
        # # "read_mailbox",
        # # "read_requests",
        # # "read_stream",
        # # "xmpp_login",
        # # ads_management,
        # # "create_event",
        # # "manage_friendlists",
        # # "manage_notifications",
        # "user_online_presence",
        # "friends_online_presence",
        # # "publish_checkins",
        # "publish_stream",
        # # "rsvp_event",
        # #
        # # OpenGraph Permissions # mandatory for sign up  - user can't sign up while saying no
        # # #####################
        # "publish_actions",
        # "user_actions.music",
        # "friends_actions.music",
        # # user_actions.news,
        # # friends_actions.news,
        # "user_actions.video",
        # "friends_actions.video",
        #       
        # # offline_access,
        # ]
  end
end