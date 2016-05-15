Blogit.configure do |config|
  config.include_comments = :active_record

  # When using disqus comments, what is the shortname of your forum ?
  # config.disqus_shortname = "YOURUSERNAME"

  config.include_share_bar = true
  config.twitter_username = "@hacktues"
  config.blogger_display_name_method = :full_name
  config.datetime_format = :short
  config.posts_per_page = 5
  config.ajax_comments = true
  config.default_parser = :markdown
  config.highlight_code_syntax = true
  config.rss_feed_title = "#{Rails.application.engine_name.titleize} Blog Posts"
  config.rss_feed_description = "Latest from #{Rails.application.engine_name.titleize}"

  # When using redcarpet as content parser, pass these options as defaults.
  # @see here for more options: https://github.com/tanoku/redcarpet
  config.redcarpet_options = {
    hard_wrap: true,
    filter_html: true,
    autolink: true,
    no_intraemphasis: true,
    fenced_code_blocks: true,
    gh_blockcode: true
  }

  #config.layout = "application"

  # List of states that will be visible to the public
  config.active_states = [:published]

  # List of states that will hide the posts from the public.
  config.hidden_states = [:draft, :archive]
end
