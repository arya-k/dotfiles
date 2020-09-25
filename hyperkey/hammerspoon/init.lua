-- CONSTANTS:
hyper = {"cmd", "alt", "ctrl", "shift"}

-- CONFIG RELOADING:
hs.alert.show("Config Loaded")
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()


-- HYPER APPLICATION BINDINGS:
application_bindings = {
    ["S"] = "Safari",
    ["D"] = "Sublime Text",
    ["C"] = "Calendar",
    ["T"] = "Terminal",
    ["E"] = "Mail",
    ["I"] = "Music",
    ["V"] = "Visual Studio Code",
    ["M"] = "Goofy"
}

for k,v in pairs(application_bindings) do
    hs.hotkey.bind(hyper, k, function()
        hs.application.launchOrFocus(v)
    end)
end

hs.hotkey.bind(hyper, "G", function()
    hs.screen.setForceToGray(not hs.screen.getForceToGray())
end)

-- WINDOW MANIPULATION:
hs.window.animationDuration = 0
function moveWindow(dir)
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()

    function closeTo(x, y, w, h)
        local epsilon = math.min(f.w, f.h)/10

        local cx, cy = f.x + f.w/2, f.y + f.h/2
        local tx, ty = x + w/2, y + h/2
        return math.abs(cx-tx) < epsilon and
               math.abs(cy-ty) < epsilon
    end

    -- determine the window's current box.
    local currentBox = "C"
    if closeTo(max.x, max.y, max.w/2, max.h) then
        currentBox = "L"
    elseif closeTo(max.x + (max.w/2), max.y, max.w/2, max.h) then
        currentBox = "R"
    end

    function setBounds(target)
        local max = win:screen():frame()
        f.y, f.h = max.y, max.h
        if target == "C" then
            f.x, f.w = max.x, max.w
        elseif target == "L" then
            f.x, f.w = max.x, max.w/2
        elseif target == "R" then
            f.x, f.w = max.x + (max.w/2), max.w/2
        end
        win:setFrame(f)
    end

    if currentBox == "C" then -- goal: adjust in same screen
        setBounds(dir)
    elseif currentBox ~= dir then -- goal: shift to center
        setBounds("C")
    else -- goal: move to next monitor in given direction
        if dir == "L" and win:screen():toWest() ~= nil then
            win:moveOneScreenWest()
            setBounds("R")
        elseif dir == "R" and win:screen():toEast() ~= nil then
            win:moveOneScreenEast()
            setBounds("L")
        end
    end
end

hs.hotkey.bind(hyper, "H", function() moveWindow("L") end)
hs.hotkey.bind(hyper, "L", function() moveWindow("R") end)

-- WORKSPACE BINDINGS
function moveSpecifiedWindowLR(LR, win)
    local f = win:frame()
    local max = win:screen():frame()
    if LR == "L" then
        f.x, f.y = max.x, max.y
    else
        f.x, f.y = max.x + (max.w * 0.5), max.y
    end
    f.w, f.h = max.w * 0.5, max.h
    win:setFrame(f)
end

WORKSPACES = {
    { title="~", fn=function() workspaceMenu:setTitle("~") end },

    { title="~eecs281", fn=function() 
        workspaceMenu:setTitle("~eecs281")
        hs.alert.show("TODO: eecs281")
    end },

    { title="~math217", fn=function() 
        workspaceMenu:setTitle("~math217") 
        hs.alert.show("TODO: math217")
    end },

    { title="~battle", fn=function() 
        workspaceMenu:setTitle("~battle")
        hs.alert.show("TODO: battlecode")
    end },

    { title="~usaco", fn=function() 
        workspaceMenu:setTitle("~usaco")
        hs.osascript.applescript([[
            tell application "Safari" 
                make new document with properties {URL:"http://train.usaco.org"}
                activate
            end tell
        ]])
        moveSpecifiedWindowLR("L", hs.application.find("com.apple.Safari"):focusedWindow())

        hs.execute("/usr/local/bin/subl --project ~/Documents/usaco/usaco.sublime-project")
        moveSpecifiedWindowLR("R", hs.application.find("com.sublimetext.3"):focusedWindow())
    end },
}

-- workspaceMenu = hs.menubar.new():setTitle("~")
-- for k, v in ipairs(WORKSPACES) do
--     v["shortcut"] = tostring(k-1)
--     hs.hotkey.bind(hyper, tostring(k-1), v["fn"])
-- end

-- workspaceMenu:setMenu(WORKSPACES)
