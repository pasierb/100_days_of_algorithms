require './hanoi_tower'

tower = HanoiTower.new(height: 3)

puts "initial state: #{tower.rods.inspect}"

tower.solve do |t|
  puts "step #{t.move_count}: #{t.rods.inspect}"
end
