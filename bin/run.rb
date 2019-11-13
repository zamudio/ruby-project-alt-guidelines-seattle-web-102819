require_relative '../config/environment'

cli = CommandLineInterface.new
# start_sound = Sound.new('Startup1.wav')
# start_sound.play
cli.greet
cli.options