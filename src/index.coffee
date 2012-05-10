html ->
  head ->
    meta charset:'utf-8'
    link rel:'stylesheet', href:'style.css'
    script src:"https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", ''
    script src:"./jquery.timeago.js", ''
    script src:"./jquery.githubLatestCommitsWidget.js", ''

  body ->
    div id:'container', ''

    coffeescript ->

      $ ->
        getUrlVars = ->
          vars = []
          hash = undefined
          hashes = window.location.href.slice(window.location.href.indexOf("?") + 1).split("&")
          i = 0

          while i < hashes.length
            hash = hashes[i].split("=")
            vars.push hash[0]
            vars[hash[0]] = hash[1]
            i++
          vars

        getUrlVar = (name) ->
          $.getUrlVars()[name]

        options = getUrlVars()

        $('#container').githubLatestCommitsWidget options
