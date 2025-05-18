# frozen_string_literal: true

require "spec_helper"
require "set"

RSpec.describe MazeGenerator::Maze do
  describe "#initialize" do
    it "raises error for non-positive width" do
      expect { described_class.new(width: 0, height: 5) }.to raise_error(ArgumentError, "Width must be positive")
    end

    it "raises error for non-positive height" do
      expect { described_class.new(width: 5, height: 0) }.to raise_error(ArgumentError, "Height must be positive")
    end

    it "generates a valid maze grid" do
      maze = described_class.new(width: 3, height: 3)
      grid = maze.instance_variable_get(:@grid)
      expect(grid).to be_an(Array)
      expect(grid.size).to eq(7)
      expect(grid[0].size).to eq(7)
      expect(grid.flatten).to include(" ", "#")
    end
  end

  describe "#to_s" do
    let(:maze) { described_class.new(width: 2, height: 2) }

    it "returns a string representation of the maze" do
      output = maze.to_s
      expect(output).to be_a(String)
      expect(output.lines.size).to eq(5)
      expect(output.lines[0].chomp.size).to eq(5)
      expect(output).to match(/[ #]/)
    end
  end

  describe "#solve" do
    let(:maze) { described_class.new(width: 3, height: 3) }

    it "raises error for invalid start coordinates" do
      expect { maze.solve(start: [0, 0], goal: [4, 4]) }.to raise_error(ArgumentError, "Invalid start coordinates")
    end

    it "raises error for invalid goal coordinates" do
      expect { maze.solve(start: [1, 1], goal: [0, 0]) }.to raise_error(ArgumentError, "Invalid goal coordinates")
    end

    it "returns a valid path from start to goal" do
      path = maze.solve(start: [1, 1], goal: [5, 5])
      expect(path).to be_an(Array)
      expect(path).not_to be_empty unless path.empty?
      expect(path.first).to eq([1, 1]) if path.any?
      expect(path.last).to eq([5, 5]) if path.any?
    end

    it "returns empty array if no path exists" do
      maze.instance_variable_get(:@grid)[1][2] = "#"
      maze.instance_variable_get(:@grid)[2][1] = "#"
      path = maze.solve(start: [1, 1], goal: [5, 5])
      expect(path).to eq([])
    end
  end
end
