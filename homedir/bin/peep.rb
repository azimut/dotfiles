#!/usr/bin/env ruby

require 'io/console'

Window = Struct.new(:id, :screen_width, :screen_height, :width, :height, :corner) do
  def scale(by)
    self.height = (height.fdiv(width) * width * by).round
    self.width = (width * by).round
    _ = `xdotool windowsize #{id} #{width} #{height}`
  end

  def reposition
    case corner
    when :tr
      x = screen_width - width
    when :bl
      y = screen_height - height
    when :br
      x = screen_width - width
      y = screen_height - height
    end
    _ = `xdotool windowmove #{id} #{x or 0} #{y or 0}`
  end

  def move_up
    self.corner = :tr if corner == :br
    self.corner = :tl if corner == :bl
  end

  def move_down
    self.corner = :br if corner == :tr
    self.corner = :bl if corner == :tl
  end

  def move_left
    self.corner = :tl if corner == :tr
    self.corner = :bl if corner == :br
  end

  def move_right
    self.corner = :tr if corner == :tl
    self.corner = :br if corner == :bl
  end
end

def make_target
  mpv = `xdotool search --class mpv`.chomp.to_i
  pip = `xdotool search --name picture-in-picture`.chomp.to_i
  if (id = [mpv, pip].find(&:positive?))
    swidth, sheight = `xrandr`.scan(/current (\d+) x (\d+)/).flatten.map(&:to_i)
    width, height = `xdotool getwindowgeometry #{id}`
                    .scan(/(\d+)x(\d+)/)
                    .flatten
                    .map(&:to_i)
    Window.new(id, swidth, sheight, width, height, :tr)
  end
end

target = make_target
target.reposition

loop do
  input = STDIN.getch
  case input
  when '+'
    target.scale(1.1)
  when '-'
    target.scale(0.9)
  when 'k'
    target.move_up
  when 'j'
    target.move_down
  when 'h'
    target.move_left
  when 'l'
    target.move_right
  when 'q'
    break
  end
  target.reposition
end
