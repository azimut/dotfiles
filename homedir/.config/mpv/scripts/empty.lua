
-- Delete the file, by replacing it with a empty file
function delete_current_file()
   local currently_played_file = mp.get_property("path")
   os.execute("touch rmf.temp")
   os.execute("mv rmf.temp " .. currently_played_file)
   mp.commandv("show-text", "Deleted", 5000)
end

mp.add_forced_key_binding("ctrl+k",
                          "delete_current_file",
                          delete_current_file)
