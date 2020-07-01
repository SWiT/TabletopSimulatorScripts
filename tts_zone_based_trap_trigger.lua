--[[ 
This script is used to hide "traps" in TTS RPG games. Like floor spikes, fireballs, boulders, hidden monsters, etc. 
The objects with this script that are flipped (F) will be hidden onLoad.
The object is flipped over and reavealed when any object ENTERS the Scripting Zone.
The object can be hidden again by flipping it back over (F).

1.) Add a Scripting Zone and your trap object. Normally, your trap object will be within this zone.
2.) Flip the trap object (F) if you want to hide it on load.
2.) Save and Load your game.
3.) Copy the Scripting Zones GUID
4.) Replace the Scripting Zone GUID value in the script below.
5.) Copy and paste this script into the objects scipting editor.
6.) Save and Play


--]]
szg = "SCRIPTING_ZONE_GUID"  -- Set this value to the GUID of the Scripting Zone you want to trigger the trap.


function onload()
    -- print("Trap " .. self.getGUID() .." is_face_down:" .. tostring(self.is_face_down))
    if self.is_face_down == false then
        showtrap()
    else
        hidetrap()
    end
end


function update()
    if self.is_face_down == false then
        if hidden == true then
            showtrap()
        end
    else
        if hidden == false then
            hidetrap()
        end
    end
end


function onObjectEnterScriptingZone(zone, obj)
    if zone.guid == szg then
        -- print(obj.getGUID() .. " " .. obj.getName() .. " entered zone " .. zone.getGUID())
        showtrap()
    end
end


function hidetrap()
    -- print("Hiding Trap " .. self.guid ..".")
    self.attachInvisibleHider("hide", true, {"Blue", "White", "Pink", "Red", "Yellow", "Green"})
    hidden = true
end


function showtrap()
    -- print("Show Trap " .. self.guid ..".")
    self.setRotationSmooth({x=0,y=0,z=0}, false, true)
    self.attachInvisibleHider("hide", false, {"Blue", "White", "Pink", "Red", "Yellow", "Green"})
    hidden = false    
end