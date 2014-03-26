module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    sshconfig:
      production:
        host: 'geniustrade.com'
        port: 22
        username: 'geniustrade'
        path: '/home/geniustrade/website'
        privateKey: grunt.file.read("/Users/damien/.ssh/id_rsa")

    sftp:
      deploy:
        files:
          './': [
            'index.html'
            'custom.css'
            'img/*'
          ]
        options:
          path: '/home/geniustrade/website'
          createDirectories: true
          showProgress: true

  grunt.loadNpmTasks('grunt-ssh')

  grunt.registerTask(
    'deploy'
    [
      'sftp:deploy'
    ]
  )
