#!/usr/bin/env ruby

# file: unichron.rb

require 'subunit'
require 'chronic_cron'
require 'christian_calendar'


class Unichron

  attr_reader :r

  def initialize(obj, mode=nil, debug: false)

    @mode, @debug = mode, debug
    @r = select_method(obj)
    
  end

  # Returns the elapsed time in a humanized format
  # e.g. elapsed(Time.now - 4000) #=> 1h
  # note: An elapsed time more than a day is returned as a calendar date
  #
  def elapsed(limit=:day)
    
    elapsed = Time.now - @r

    relative_time = if elapsed < Time.now - (Date.today - 1).to_time then
      Subunit.seconds(elapsed).strfunit("%s")
    else
      @r.strftime("%b %d")
    end    
    
  end

  def to_seconds
    @r
  end
  
  def to_date
    @r.to_date if valid?
  end  
  
  def to_i()
    @r.to_time.to_i if valid?
  end

  def to_time
    @r.to_time if valid?
  end
  
  def valid?
    @r.respond_to? :to_time
  end

  private

  def select_method(obj)

    if obj.is_a? String then

      s = obj
      
      r = if @mode = :little_endian
        Chronic.parse(s, :endian_precedence => :little)
      else
        Chronic.parse(s)
      end
      
      puts 'r1: ' + r.inspect if @debug      
      return r if r
      
      r = ChronicCron.new s
      puts 'r2: ' + r.inspect if @debug
      return r if r.valid?

      r = ChronicDuration.parse s
      puts 'r3: ' + r.inspect if @debug
      return r if r
      
      r = ChristianCalendar.new.query(obj)
      puts 'r4 ' + r.inspect if @debug      
      return r if r

      
      return nil

    else
      obj
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
