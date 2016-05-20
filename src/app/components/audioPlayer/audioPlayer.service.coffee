angular.module 'jaMusic1'
  .factory 'AudioPlayer', (ngAudio, $rootScope, $localStorage) ->
    p = null

    # getters

    getAudio = () ->
      p

    getProgress = () ->
      if isAudio()
        return p.progress
      0

    getDuration = () ->
      if isAudio()
        return p.duration
      -1

    getCurrentTime = () ->
      if isAudio()
        return p.currentTime
      0

    getVolume = () ->
      if isAudio()
        return p.volume
      1

    isAudio = () ->
      if p and p.audio
        return yes
      no

    isPaused = () ->
      if isAudio()
        return p.audio.paused
      no

    # setters

    setProgress = (progress) ->
      if isAudio()
        p.progress = progress

    setVolume = (volume) ->
      if isAudio()
        $localStorage.volume = volume
        p.volume = volume

    # functions

    playPause = () ->
      if isAudio()
        if p.audio.paused
          p.play()
        else
          p.pause()

    stop = () ->
      if isAudio()
        p.pause()
        p.currentTime = 0

    loadTrack = (url) ->
      volume = $localStorage.volume
      if isAudio()
        stop()
      p = ngAudio.load(url)
      p.volume = volume if volume
      p.play()

    factory =
      # getters
      getAudio: getAudio
      getProgress: getProgress
      getDuration: getDuration
      getCurrentTime: getCurrentTime
      getVolume: getVolume
      isAudio: isAudio
      isPaused: isPaused
      # setters
      setProgress: setProgress
      setVolume: setVolume
      # functions
      playPause: playPause
      stop: stop
      loadTrack: loadTrack
