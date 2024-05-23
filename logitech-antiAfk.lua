

ClearLog()
--EnablePrimaryMouseButtonEvents(true)
toggle_button = "capslock"-- What mouse button should control the toggle
local IsOn = false

local function alttab()
  PressKey(0x38)    
  PressKey(0x0f)
  Sleep(10)
  ReleaseKey(0x0f)  
  ReleaseKey(0x38)
end
 
function betterSleep(Delay)
  local ST = GetRunningTime()
  repeat
    Sleep(10)
  until (GetRunningTime()-ST)>Delay or IsKeyLockOn(toggle_button)==false
end      
  
function OnEvent(event, arg)
  if IsKeyLockOn(toggle_button) and IsOn==false then
    IsOn = true    
    OutputLogMessage("on \n")
    local n = 0
    repeat    
        local x, y = GetMousePosition()
        MoveMouseRelative(1280, 720)
        alttab() 
        Sleep(50)
        
        MoveMouseRelative(10,10)
        
        PressMouseButton(1)
        Sleep(25)
        ReleaseMouseButton(1)  
        
        MoveMouseRelative(-10, -10)
        
        Sleep(25)
        alttab()
        Sleep(50)
        
        MoveMouseTo(x, y)
        n = n + 1
        OutputLogMessage("tick : "..n.."\n")
        betterSleep(85000)    
    until IsKeyLockOn(toggle_button)==false
    OutputLogMessage("off \n")
    IsOn = false	
  end    
end
