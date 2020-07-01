-- Set the Scripting Zone GUID to trigger the trap.
szg = "14bf2a"
hidden = true


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
        -- print(obj.getName() .. " entered zone " .. zone.getGUID())
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