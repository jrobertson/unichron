#!/usr/bin/env ruby

# file: unichron.rb

require 'chronic_cron'


class Unichron

  attr_reader :r

  def initialize(obj)

    @r = select_method(obj)
  end

  def to_seconds
    @r
  end

  def to_time
    @r.to_time
  end

  private

  def select_method(obj)

    if obj.is_a? String then

      s = obj
      r = Chronic.parse(s)
      return r if r
      
      r = ChronicCron.new s
      return r if r.valid?

      r = ChronicDuration.parse s
      return r if r

      return nil

    end
  end

end

module UnichronUtils
  
  class Quicktime

    attr_reader :time

    def initialize(time: Time.now, speed: 4)

      @time, @speed = Unichron.new(time).to_time, speed  

    end

    def start()

      @state = :play

      Thread.new do 

        loop do 
          (sleep 0.5; next) if @state == :pause
          @time += 1
          sleep 1.0 / @speed
        end

      end
    end

    def pause()
      @state = :pause
    end

    def play()
      @state = :play
    end

    def set_time(s)
      @time = Chronic.parse(s)
    end
  end
end
