function getTrackByName(name)
  for trackIndex = 0, reaper.CountTracks(0) - 1 do
    local track = reaper.GetTrack(0, trackIndex)
    local ok, trackName = reaper.GetSetMediaTrackInfo_String(track, 'P_NAME', '', false)

    if ok and trackName == name then
      return track
    end
  end
end

--select input track
local inTrack = getTrackByName("In")
reaper.SetOnlyTrackSelected(inTrack)

-- unmute in
reaper.Main_OnCommand(40720, 0)

-- freeze to multichannel
reaper.Main_OnCommand(41223, 0)

-- select items in track
reaper.Main_OnCommand(40421, 0)

-- unlock track
reaper.Main_OnCommand(40689, 0)

-- cut item
reaper.Main_OnCommand(40699, 0)

-- select output track
local outTrack = getTrackByName("Out")
reaper.SetOnlyTrackSelected(outTrack)

-- select items in track
reaper.Main_OnCommand(40421, 0)

-- delete items in track
reaper.Main_OnCommand(40006, 0)

-- select output track
local outTrack = getTrackByName("Out")
reaper.SetOnlyTrackSelected(outTrack)

-- go to start of project
reaper.Main_OnCommand(40042, 0)

-- paste item
reaper.Main_OnCommand(42398, 0)

-- unfreeze input track
local inTrack = getTrackByName("In")
reaper.SetOnlyTrackSelected(inTrack)
reaper.Main_OnCommand(41644, 0)
