# Introducing the unichron gem

    require 'unichron'

    r = Unichron.new('next tuesday').to_time
    #=> 2020-11-10 12:00:00 +0000 
    r = Unichron.new('last sunday in October at 2am').to_time
    #=> 2021-10-31 02:00:00 +0000 
    r = Unichron.new('5 minutes').to_seconds
    #=> 300


unichron chron chronic duration time seconds date calendar event
