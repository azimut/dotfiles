-- Ignores extensions in playlist
-- Reference: https://github.com/mpv-player/mpv/issues/2595

function ignore_this()
   local playlist = mp.get_property_native('playlist')
   for i = #playlist, 1, -1 do
      for _, extension in pairs({
            'jpg', 'jpeg', 'png', 'tif', 'tiff', 'gif', 'webp', 'svg', 'bmp',
            'mp3', 'wav', 'ogm', 'flac', 'm4a', 'wma', 'ogg', 'opus'}) do
         if playlist[i].filename:match('%.' .. extension .. '$') then
               mp.commandv('playlist-remove', i-1)
            end
         end
      end
end

mp.observe_property('playlist-count', 'number', ignore_this)
