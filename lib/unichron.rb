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

