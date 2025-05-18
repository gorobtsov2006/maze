# frozen_string_literal: true


module MazeGenerator
  # Класс, реализующий генерацию и работу с лабиринтом
  class Maze
    attr_reader :width, :height, :grid

    def initialize(width:, height:)
      raise ArgumentError, 'Width must be positive' unless width.positive?
      raise ArgumentError, 'Height must be positive' unless height.positive?

      @width = width
      @height = height
      @grid = generate_maze
    end

    def to_s
      @grid.map(&:join).join("\n")
    end

    def solve(start:, goal:)
      raise ArgumentError, 'Invalid start coordinates' unless valid_position?(start)
      raise ArgumentError, 'Invalid goal coordinates' unless valid_position?(goal)

      bfs(start, goal)
    end

    private

    def generate_maze
      grid = Array.new((@height * 2) + 1) { Array.new((@width * 2) + 1, '#') }
      carve_passages(grid, [1, 1])
      grid
    end

    def carve_passages(grid, current)
      x, y = current
      grid[x][y] = ' '
      directions = [[0, 2], [2, 0], [0, -2], [-2, 0]].shuffle
      directions.each do |dx, dy|
        nx = x + dx
        ny = y + dy
        next unless valid_cell?(nx, ny, grid)

        grid[x + (dx / 2)][y + (dy / 2)] = ' '
        grid[nx][ny] = ' '
        carve_passages(grid, [nx, ny])
      end
    end

    def valid_cell?(x, y, grid)
      x.between?(1, (@height * 2) - 1) &&
        y.between?(1, (@width * 2) - 1) &&
        grid[x][y] == '#'
    end

    def bfs(start, goal)
      queue = [[start, [start]]]
      visited = Set.new([start])
      directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]

      until queue.empty?
        (x, y), path = queue.shift
        return path if goal == [x, y]

        directions.each do |dx, dy|
          nx = x + dx
          ny = y + dy
          next unless valid_move?(nx, ny, visited)

          queue << [[nx, ny], path + [[nx, ny]]]
          visited << [nx, ny]
        end
      end
      []
    end

    def valid_position?(pos)
      x, y = pos
      x.between?(0, @height * 2) &&
        y.between?(0, @width * 2) &&
        @grid[x][y] == ' '
    end

    def valid_move?(x, y, visited)
      x.between?(0, @height * 2) &&
        y.between?(0, @width * 2) &&
        @grid[x][y] == ' ' &&
        !visited.include?([x, y])
    end
  end
end
