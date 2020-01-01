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
    ["B"] = "Bear",
    ["E"] = "Mail",
    ["I"] = "Music",
    ["R"] = "Transmission",
    ["P"] = "Pages",
    ["N"] = "Notes"
}

for k,v in pairs(application_bindings) do
    hs.hotkey.bind(hyper, k, function()
        hs.application.launchOrFocus(v)
    end)
end

hs.hotkey.bind(hyper, "M", function()
    hs.osascript.applescript([[
    	# start by opening Safari:
    	tell application "Safari" to launch
    	
    	# try to open the tab if it exists
    	tell application "Safari"
    		repeat with win in every window
    			repeat with t in every tab of win
    				if "https://www.messenger.com" is in (URL of t as string) then
    					set current tab of win to t
    					set index of win to 1
    					return
    				end if
    			end repeat
    		end repeat
    	end tell
    	
    	# try to open in an empty tab if it exists:
    	tell application "Safari"
    		repeat with win in every window
    			repeat with t in every tab of win
    				if (URL of t as string) is equal to "favorites://" then
    					set URL of t to "https://www.messenger.com/"
    					set current tab of win to t
    					set index of win to 1
    					return
    				end if
    			end repeat
    		end repeat
    	end tell
    	
    	# otherwise, open the webpage
    	do shell script "open https://www.messenger.com"
    ]])
end)

-- WINDOW MANIPULATION:
hs.window.animationDuration = 0
function moveWindow(x, y, w, h)
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()

    if x == nil then
        f.x, f.y = f.x, max.y + (max.h * y)
    else
        f.x, f.y = max.x + (max.w * x), max.y + (max.h * y)
    end

    if w == nil then
        f.w, f.h = f.w, max.h * h
    else
        f.w, f.h = max.w * w, max.h * h
    end
    win:setFrame(f)
end

hs.hotkey.bind(hyper, "return", function() moveWindow(0.0, 0.0, 1.0, 1.0) end)
hs.hotkey.bind(hyper, "H", function() moveWindow(0.0, 0.0, 0.5, 1.0) end)
hs.hotkey.bind(hyper, "L", function() moveWindow(0.5, 0.0, 0.5, 1.0) end)
hs.hotkey.bind(hyper, "J", function() moveWindow(nil, 0.0, nil, 0.5) end)
hs.hotkey.bind(hyper, "K", function() moveWindow(nil, 0.5, nil, 0.5) end)

-- WORKSPACE BINDINGS
workspaceMenu = hs.menubar.new():setTitle("~")

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

for k, v in ipairs(WORKSPACES) do
    v["shortcut"] = tostring(k-1)
    hs.hotkey.bind(hyper, tostring(k-1), v["fn"])
end

workspaceMenu:setMenu(WORKSPACES)