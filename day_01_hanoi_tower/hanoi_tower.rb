class HanoiTower

  attr_reader :height
  attr_reader :rods
  attr_reader :move_count

  def initialize(height:)
    @height = height
    reset
  end

  def solve(&block)
    reset if move_count != 0
    move(rings: height, from: @rods[0], to: @rods[2], other: @rods[1], &block)
  end

  private

  def move(rings:, from:, to:, other:, &block)
    if rings > 0
      move(rings: rings - 1, from: from, to: other, other: to, &block)

      to.push(from.pop)
      @move_count += 1
      yield(self) if block_given?

      move(rings: rings - 1, from: other, to: to, other: from, &block)
    end

    @move_count
  end

  def reset
    @move_count = 0
    @rods = [height.times.map.to_a.reverse, [], []]
  end

end
