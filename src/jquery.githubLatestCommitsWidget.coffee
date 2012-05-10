wrap = ($) ->
  $.fn.githubLatestCommitsWidget = (options) ->
    options = $.extend {}, $.fn.githubLatestCommitsWidget.defaultOptions, options
    @each ->
      callback = (response) ->
        items_html = ''

        for result in response
          items_html += """
            <li>
              <div class='commit-author-info'>
                <img class='commit-avatar' src='#{result.author.avatar_url}'>
                <a href='https://github.com/#{result.author.login}'>i
                  <span class='commit-author'>#{result.author.login}</span>
                </a>
                <span class='commit-date'>#{$.timeago(result.commit.committer.date)}</span>
                <br />
                <span class='commit-sha'>SHA: #{result.sha}</span>
              </div>
              <a class='commit-message' href='https://github.com/#{options.username}/#{options.repo}/commit/#{result.sha}' target='_blank'>#{result.commit.message}</a>
            </li>
          """

        this.html """
          <div class='latest-commits-widget'>
            <div class='latest-commits-header'>
              <div class='gh-ico'></div>
              <h4>Latest Commits to #{options.username}/#{options.repo}</h4>
            </div>
            <ul class='commit-history'>
            #{items_html}
            </ul>
          </div>
        """

      $.ajax(
        "https://api.github.com/options.repos/#{options.username}/#{options.repo}/commits?callback=dummy_callback"
        data:
          per_page: options.limit
        dataType: 'jsonp'
        type: 'get'
      ).success (response) ->
        callback(response)

  $.fn.githubLatestCommitsWidget.defaultOptions =
    limit: 10

wrap jQuery
