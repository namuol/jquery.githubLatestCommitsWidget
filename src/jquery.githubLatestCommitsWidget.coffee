#  Project: githubLatestCommitsWidget
#  Description: widget displaying a list of recent commit messages for a specified github repo 
#  Author: Louis Acresti (Adapted from code written by Tyler Hughes -- github.com/TylerLH/github-latest-commits-widget)
#  License: Apache 2.0 -- http://www.apache.org/licenses/LICENSE-2.0

# the semi-colon before function invocation is a safety net against concatenated
# scripts and/or other plugins which may not be closed properly.

# Note that when compiling with coffeescript, the plugin is wrapped in another
# anonymous function. We do not need to pass in undefined as well, since
# coffeescript uses (void 0) instead.
(($, window) ->
  # window is passed through as local variable rather than global
  # as this (slightly) quickens the resolution process and can be more efficiently
  # minified (especially when both are regularly referenced in your plugin).

  # Create the defaults once
  pluginName = 'githubLatestCommitsWidget'
  document = window.document
  defaults =
    limit: 10

  # The actual plugin constructor
  class Plugin
    constructor: (@element, options) ->
      # jQuery has an extend method which merges the contents of two or
      # more objects, storing the result in the first object. The first object
      # is generally empty as we don't want to alter the default options for
      # future instances of the plugin
      @options = $.extend {}, defaults, options

      @_defaults = defaults
      @_name = pluginName

      @init()

    init: ->
      # Place initialization logic here
      # You already have access to the DOM element and the options via the instance,
      # e.g., this.element and this.options
      callback = (response) =>
        items_html = ''

        for result in response.data
          if not result.author
            result.author =
              login: result.commit.author.email
              url: "mailto:#{result.commit.author.email}"
              avatar_url: 'github_default_avatar.png'
          else
            result.author.url = "https://github.com/#{result.author.login}"

          items_html += """
            <li>
              <img class='commit-avatar' src='#{result.author.avatar_url}'>
              <div class='commit-author'><a href='#{result.author.url}'>
                #{result.author.login}
              </a></div>
              <div class='commit-date'>#{$.timeago(result.commit.committer.date)}</div>
              <div class='commit-sha'>SHA: #{result.sha}</div>
              <a class='commit-message' href='https://github.com/#{@options.username}/#{@options.repo}/commit/#{result.sha}' target='_blank'>#{result.commit.message}</a>
            </li>
          """

        $(@element).html """
          <div class='latest-commits-widget'>
            <div class='latest-commits-header'>
              <div class='latest-commits-header-text'>Latest Commits to #{@options.username}/#{@options.repo}</div>
            </div>
            <ul class='commit-history'>
            #{items_html}
            </ul>
          </div>
        """

      $.ajax(
        "https://api.github.com/repos/#{@options.username}/#{@options.repo}/commits?callback=callback"
        data:
          per_page: @options.limit
        dataType: 'jsonp'
        type: 'get'
      ).success (response) ->
        callback(response)

  $.fn[pluginName] = (options) ->
    @each ->
      $.data(@, "plugin_#{pluginName}", new Plugin(@, options))
)(jQuery, window)
