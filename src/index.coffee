html ->
  head ->
    meta charset:'utf-8'
    #link rel:'stylesheet', href:'style.css'
    script src:"https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", ''
    script src:"./jquery.timeago.js", ''
    script src:"./jquery.githubLatestCommitsWidget.js", ''

  body ->
    div id:'container', ''

    coffeescript ->

      $ ->
        getParameterByName = (name) ->
          name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
          regexS = "[\\?&]" + name + "=([^&#]*)"
          regex = new RegExp(regexS)
          results = regex.exec(window.location.search)
          unless results?
            ""
          else
            decodeURIComponent results[1].replace(/\+/g, " ")

        theme = getParameterByName('theme') or 'default'
        url = theme+'.css'
        if (document.createStyleSheet)
          document.createStyleSheet(url)
        else
          $('<link rel="stylesheet" type="text/css" href="' + url + '" />').appendTo('head')

        options =
          username: getParameterByName 'username'
          repo: getParameterByName 'repo'
          limit: getParameterByName 'limit'


        $('#container').githubLatestCommitsWidget options
