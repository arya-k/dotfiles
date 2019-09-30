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
    ["X"] = "Texpad",
}

for k,v in pairs(application_bindings) do
    hs.hotkey.bind(hyper, k, function()
        hs.application.launchOrFocus(v)
    end)
end

hs.hotkey.bind(hyper, "M", function()
    hs.osascript.applescript([[
        on open_website()        	# start by opening Safari:        	tell application "Safari" to launch        	        	# try to open the tab if it exists        	tell application "Safari"        		repeat with win in every window        			repeat with t in every tab of win        				if "https://www.messenger.com" is in (URL of t as string) then        					set current tab of win to t        					set index of win to 1        					return        				end if        			end repeat        		end repeat        	end tell        	        	# try to open in an empty tab if it exists:        	tell application "Safari"        		repeat with win in every window        			repeat with t in every tab of win        				if (URL of t as string) is equal to "favorites://" then        					set URL of t to "https://www.messenger.com/"        					set current tab of win to t        					set index of win to 1        					return        				end if        			end repeat        		end repeat        	end tell        	        	# otherwise, open the webpage        	do shell script "open https://www.messenger.com"        end open_website                on wait_for_load()        	tell front document of application "Safari"        		activate        		repeat until length of (source as text) is not 0        			delay 0.5        		end repeat        	end tell        end wait_for_load                on auto_login()        	tell application "Safari"        		set at_login to (do JavaScript "document.getElementById('loginform') !== null;" in document 1)        	end tell        	        	if at_login then        		delay 0.2        		tell application "System Events" to tell application process "Safari"        			set app_position to position of window 1        			set app_size to size of window 1        			        			set x_top to item 1 of app_position        			set y_top to item 2 of app_position        			set x_range to item 1 of app_size        			set y_range to item 2 of app_size        			        			# enter the window        			click at {x_top + (x_range / 5), y_top + (y_range / 5)}        			        			# tab to the password prompt        			repeat        				tell application "Safari"        					if (do JavaScript "document.activeElement.type == 'password';" in document 1) then        						exit repeat        					end if        				end tell        				keystroke tab        				delay 0.2        			end repeat        			        			key code 125        			delay 0.1        			keystroke return        		end tell        	end if        end auto_login                # main logic:        on run        	open_website()        	wait_for_load()        	auto_login()        end run
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

-- LaTeXify function
hs.hotkey.bind({"cmd", "alt"}, "L", function()
    local raw = hs.pasteboard.getContents()
    if raw ~= nil then
        processed = raw:gsub(" ", "") -- remove whitespace first.
                       :gsub("≡", "\\equiv")
                       :gsub("∃", "\\exists ")
                       :gsub("∀", "\\forall ")
                       :gsub("∧", "\\wedge ")
                       :gsub("∨", "\\vee ")
                       :gsub("¬", "\\neg ")
                       :gsub("→", "\\rightarrow ")
                       :gsub("↔", "\\leftrightarrow ")
                       :gsub("=", "\\eq ")
                       :gsub("≠", "\\neq ")
                       :gsub("−", "-") -- strange minus sign
        hs.pasteboard.setContents(processed)
        hs.alert.show("Processed LaTeX")
    end
end)
