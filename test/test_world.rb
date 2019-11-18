lib_path = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_path) unless $LOAD_PATH.include?(lib_path)

require 'minitest/autorun'
require 'game_of_life'

class WorldTest < Minitest::Test
  def test_crowded_to_death
    grid = [
      [false, true, false],
      [true, true, true],
      [false, true, false]
    ]
    world = GameOfLife::World.new(grid)
    new_world = world.next
    assert !new_world.grid[1][1]
  end

  def test_alone_to_death
    grid = [
      [false, true, false],
      [false, true, false],
      [false, false, false]
    ]
    world = GameOfLife::World.new(grid)
    new_world = world.next
    assert !new_world.grid[1][1]
  end

  def test_rebirth_to_alive
    grid = [
      [false, true, false],
      [true, false, true],
      [false, false, false]
    ]
    world = GameOfLife::World.new(grid)
    new_world = world.next
    assert new_world.grid[1][1]
  end
end
