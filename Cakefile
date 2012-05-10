fs = require 'fs'
ck = require 'coffeecup'
stylus = require 'stylus'
{exec} = require 'child_process'

task 'build', 'Create compiled HTML/CSS output', ->
  console.log 'build her a cake or something...'
  fn = 'src/jquery.githubLatestCommitsWidget.coffee'
  exec "coffee -o . --compile #{fn}", (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

  result = ck.render fs.readFileSync('src/index.coffee', 'utf-8')
  console.log 'building index.html'
  fs.writeFileSync 'index.html', result

  console.log 'building css'
  for theme in ['default', 'dark', 'mini', 'mini-dark', 'mini-clear']
    stylus.render fs.readFileSync("src/#{theme}.styl",'utf-8'), {filename: theme+'.css'}, (err, css) ->
      throw err if err
      fs.writeFileSync theme+'.css', css
