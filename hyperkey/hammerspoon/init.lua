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
    ["I"] = "iTunes",
    ["R"] = "Transmission",
    ["P"] = "Pages",
    ["X"] = "XiEditor",
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


-- Center
hs.hotkey.bind(hyper, "return", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()

    f.x, f.y = max.x, max.y
    f.w, f.h = max.w, max.h
    win:setFrame(f)
end)


-- Left
hs.hotkey.bind(hyper, "H", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()

    f.x, f.y = max.x, max.y
    f.w, f.h = max.w / 2, max.h
    win:setFrame(f)
end)


-- Right
hs.hotkey.bind(hyper, "L", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()

    f.x, f.y = max.x + (max.w / 2), max.y
    f.w, f.h = max.w / 2, max.h
    win:setFrame(f)
end)
