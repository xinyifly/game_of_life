Gem::Specification.new do |s|
  s.name = 'game_of_life'
  s.version = '0.1.0'
  s.summary = "Conway's Game of Life"
  s.author = 'Zeyu Chen'

  s.license = 'GPL-3.0'
  s.homepage = 'https://github.com/xinyifly/game_of_life'

  s.files = Dir['lib/**/*', 'bin/*']
  s.executables << 'blinker'

  s.add_development_dependency 'minitest', '~> 5.13'
  s.add_development_dependency 'rake', '~> 13.0'
end
