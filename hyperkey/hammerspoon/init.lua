-- CONSTANTS:
hyper = {"cmd", "alt", "ctrl", "shift"}

-- CONFIG RELOADING:
hs.alert.show("Config Loaded")
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- HYPER APPLICATION BINDINGS:
application_bindings = {
    ["S"] = "Safari",
    ["V"] = "Sublime Text",
    ["C"] = "Calendar",
    ["T"] = "Terminal",
    ["B"] = "Bear",
    ["E"] = "Mail",
    ["M"] = "Goofy",
    ["I"] = "iTunes",
    ["R"] = "Transmission",
    ["P"] = "Pages"
}

for k,v in pairs(application_bindings) do
    hs.hotkey.bind(hyper, k, function()
        hs.application.launchOrFocus(v)
    end)
end

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