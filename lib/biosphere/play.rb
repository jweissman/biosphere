# bootstrap ui
require 'biosphere'
require_relative '../../config/environment'

game = Biosphere.config.game

game.window = Biosphere::Medium.bootstrap_game
game.window.show
