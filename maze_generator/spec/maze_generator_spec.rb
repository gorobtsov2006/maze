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
  end