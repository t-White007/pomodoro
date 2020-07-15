class Pomodoro
	def start
    readTimerInformation
		playSession
    finishSession
	end

  def readTimerInformation
    @quietDuration = getQuietDuration
    @standardDuration = getStandardDuration
    @breakDuration = getBreakDuration
    @totalDuration = getTotalDuration
  end

	def getQuietDuration
		puts "How long would you like each sitting timer to run for?\n"
		return gets.chomp.to_f
	end

	def getStandardDuration
		puts "How long would you like each standard timer to run for?\n"
		return gets.chomp.to_f
	end

	def getBreakDuration
		puts "How long would you like each break to run for?\n"
		return gets.chomp.to_f
	end

	def getTotalDuration
		puts "How long would you like the total work session to run for?\n"
		return gets.chomp.to_f
	end

	def playSession
    @pomodoroDuration = @quietDuration + @standardDuration + @breakDuration
		@numberOfPomodoros = @totalDuration.to_i / @pomodoroDuration.to_i
    @remainingSessionDuration = @totalDuration - (@numberOfPomodoros * @pomodoroDuration)

    for i in 1..@numberOfPomodoros do
      playQuietTimer
      playStandardTimer
      playBreakTimer
    end

    playFinalTimer

  end

  def playQuietTimer
    print "Stay quiet and work -_-\n"
    sleep(60*@quietDuration)
  end

  def playStandardTimer
    print "Continue working ._.\n"
    sleep(60*@standardDuration)
  end

  def playBreakTimer
    print "Break time! ^_^\n"
    sleep(60*@breakDuration)
  end

  def playFinalTimer
    print "Stay quiet and work -_-\n"
    sleep(60*@remainingSessionDuration)
  end

  def finishSession
    print "Finished!\n"
  end

end

p_timer = Pomodoro.new
p_timer.start