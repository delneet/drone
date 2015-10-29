require 'artoo'

connection :leapmotion, adaptor: :leapmotion, port: '127.0.0.1:6437'
device :leapmotion, driver: :leapmotion

work do
  # on leapmotion, open: :on_open
  # on leapmotion, frame: :on_frame
  # on leapmotion, close: :on_close
  on leapmotion, hand: :on_hand
end

def on_hand(name, hand)
  # snd
  print "\r#{hand.palm_x},#{hand.palm_y},#{hand.palm_z}" if hand
end

def on_open(*args)
  puts args.inspect
end

def on_frame(*args)
  frame = args[1]
  puts frame
  puts frame.hands
  puts frame.gestures
  puts frame.pointables
end

def on_close(*args)
  puts args
end
