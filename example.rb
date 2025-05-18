require_relative 'maze_generator/lib/maze_generator'


# Создать лабиринт 5x3
maze = MazeGenerator::Maze.new(width: 5, height: 3)

# Вывести лабиринт
puts "Maze:"
puts maze.to_s

# Найти путь от [1, 1] до [5, 5]
path = maze.solve(start: [1, 1], goal: [5, 5])
puts "\nPath: #{path}"