require 'io/console'

Window = Struct.new(:id, :width, :height)

def make_screen
  width, height = `xrandr`.scan(/current (\d+) x (\d+)/).flatten.map(&:to_i)
  return Window.new(0, width, height)
end

def make_target
  mpv = `xdotool search --class mpv`.chomp.to_i
  pip = `xdotool search --name picture-in-picture`.chomp.to_i
  if (wid = [mpv,pip].find(&:positive?))
    width, height = `xdotool getwindowgeometry #{wid}`.scan(/(\d+)x(\d+)/).flatten.map(&:to_i)
    return Window.new(wid, width, height)
  end
end

screen = make_screen()
target = make_target()

while 1
  input = STDIN.getch
  if input == "f"
    break
  end
end
