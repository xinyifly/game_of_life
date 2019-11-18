module GameOfLife
  class World
    attr_reader :grid

    def initialize(grid)
      @grid = grid
    end

    def next
      new_grid = grid.map.with_index do |row, y|
        row.map.with_index do |_cell, x|
          calc(x, y)
        end
      end
      World.new(new_grid)
    end

    def draw
      system 'clear'
      grid.each do |row|
        row.each do |cell|
          print(cell ? '██' : '  ')
        end
        puts
      end
    end

    private

    def calc(x, y)
      count = neighbours(x, y).count { |(nx, ny)| grid[ny][nx] }

      will_die = count < 2 || count > 3
      will_rebirth = count == 3

      (!will_die && grid[y][x]) || will_rebirth
    end

    def neighbours(x, y)
      square = [x - 1, x, x + 1].product([y - 1, y, y + 1])
      square.select { |(nx, ny)| in_bounds?(nx, ny) } - [[x, y]]
    end

    def in_bounds?(x, y)
      x >= 0 && y >= 0 && x < grid[0].length && y < grid.length
    end
  end
end
