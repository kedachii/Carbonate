
# Carbonate :3
ui library based on uwuware
i'm not good at writing these

# Usage
## Loading the library:
```lua
local uilib = loadstring(game:HttpGet("https://raw.githubusercontent.com/kedachii/uilib/main/library.lua", true))()
```
## Using the library:
creating the gui **\<gui>**
```lua
local gui = uilib:CreateGUI(<guiname>)
```

creating a tab  **\<tab>**
```lua
local tab = uilib:CreateTab(<gui>, <guiname>)
```

creating a section **\<section>**
```lua
local tab = uilib:CreateSection(<tab>, <sectionname>)
```

creating a textbox -- returns textbox
```lua
local tab = uilib:CreateTextBox(<tab>, <section>, <placeholdertext>)
```

creating a button  -- returns textbutton
```lua
local tab = uilib:CreateTab(<section>, <name>)
```

creating a toggle button  -- returns boolvalue
```lua
local tab = uilib:CreateToggle(<section>, <name>)
```

creating a keybind -- returns string (lower)
```lua
local tab = uilib:CreateKeybind(<section>, <name>, <bind>)
```

# to do:
 - sliders
 - colour picker
 - uh some other stuff too



