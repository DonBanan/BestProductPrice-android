-----------------------------------------------------------------------------------------
--
-- login_view.lua
--
-----------------------------------------------------------------------------------------

local mime = require("mime") -- for url encoding
local json = require("json") -- for handling json data
local widget = require("widget") -- for status label
local color = require("convertcolor")

--Init values
local font = "HelveticaNeue" or system.nativeFont
local userid = nil
local password = nil
local URL = nil

-- create background to fill screen
local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
background:setFillColor(color.rgb(30, 30, 30));

-- create login screen
local loginScreen = display.newGroup()
loginScreen:insert(background)

-- create label form
local title = display.newText( "Member Login", display.contentCenterX, 170, 'Marvin.otf', 42 )
title:setFillColor( 1 )
loginScreen:insert(title)

local labelUsername = display.newText( "Username", display.contentCenterX, display.contentCenterY - 140, 'Marvin.otf', 15 )
labelUsername:setFillColor( 1 )
loginScreen:insert(labelUsername)

local labelPassword = display.newText( "Password", display.contentCenterX, display.contentCenterY - 60, 'Marvin.otf', 15 )
labelPassword:setFillColor( 1 )
loginScreen:insert(labelPassword)

local labelReturnStatus = display.newText( "", display.contentCenterX, display.contentCenterY + 20, 'Marvin.otf', 15 )
labelReturnStatus:setFillColor( color.rgb(255, 17, 0) )
loginScreen:insert(labelReturnStatus)

-- create username text field
local frmUsernameRect = display.newRect( display.contentCenterX, display.contentCenterY - 100, display.contentCenterX, 40 )
frmUsernameRect:setFillColor( 1)

local frmUsername = native.newTextField( display.contentCenterX, display.contentCenterY - 100, display.contentCenterX, 40 )
frmUsername:setTextColor( 0 )
frmUsername.hasBackground = false
frmUsername.font = native.newFont('Marvin.otf', 15)
frmUsername.align = "left"
frmUsername.isEditable = true
loginScreen:insert(frmUsername)

-- handle field events
function frmUsername:userInput(event)
    if(event.phase == "began") then
        -- you could implement tweening of object to get out of the way of the keyboard here
        print("Began frmUsername" .. ' ' .. event.target.text)
        event.target.text = ''
    elseif(event.phase == "editing") then
        -- fired with each new character
        print("Editing frmUsername" .. ' ' .. event.target.text)
    elseif(event.phase == "ended") then
        -- fired when the field looses focus as a result of some other object being interacted with
        print("Ended frmUsername" .. ' ' .. event.target.text)
    elseif(event.phase == "submitted") then
        -- you could implement tweening of objects to their original postion here
        print("Submitted frmUsername" .. ' ' .. event.target.text)
    end
end
frmUsername:addEventListener("userInput",frmUsername)

-- create password text field
local frmPasswordRect = display.newRect( display.contentCenterX, display.contentCenterY - 20, display.contentCenterX, 40 )
frmPasswordRect:setFillColor( 1)

local frmPassword = native.newTextField( display.contentCenterX, display.contentCenterY - 20, display.contentCenterX, 40 )
frmPassword:setTextColor( 0 )
frmPassword.hasBackground = false
frmPassword.font = native.newFont('Marvin.otf', 15)
frmPassword.align = "left"
frmPassword.isEditable = true
loginScreen:insert(frmPassword)

-- handle field events
function frmPassword:userInput(event)
    if(event.phase == "began") then
        -- you could implement tweening of object to get out of the way of the keyboard here
        print("Began Password" .. ' ' .. event.target.text)
        event.target.text = ''
    elseif(event.phase == "editing") then
        -- fired with each new character
        print("Editing Password" .. ' ' .. event.target.text)
    elseif(event.phase == "ended") then
        -- fired when the field looses focus as a result of some other object being interacted with
        print("Ended Password" .. ' ' .. event.target.text)
    elseif(event.phase == "submitted") then
        -- you could implement tweening of objects to their original postion here
        print("Submitted Password" .. ' ' .. event.target.text)
    end
end
frmPassword:addEventListener("userInput",frmPassword)


-- ----------------------------------------------------------------------------
-- HANDLE JSON RETURN VALUES - DISPLAY IN STATUS LABEL
-- ----------------------------------------------------------------------------
local function loginCallback(event)

    -- print("inside loginCallback function")

    if ( event.isError ) then
        print( "Network error!");
    else
        print ( "RESPONSE: " .. event.response )
        local data = json.decode(event.response)

        -- do with data what you want...
        if data.result == 200 then
            -- player logged in okay
            print("Welcome back",data.firstname:gsub("^%l", string.upper))
            labelReturnStatus.text = "Welcome back "..data.firstname:gsub("^%l", string.upper)


            -- CHANGE SCENES OR DO SOMTHING ELSE HERE

        else
            -- prompt them to login again
            print("Please try again")
            labelReturnStatus.text = "Please try again"

        end
    end

    return true;
end

-- ----------------------------------------------------------------------------
-- MAKE KEYBOARD GO AWAY ON BACKGROUND TAP
-- ----------------------------------------------------------------------------
function background:tap(event)
    native.setKeyboardFocus(nil)
end
background:addEventListener("tap",background)

-- ----------------------------------------------------------------------------
-- HANDLE BUTTON PRESS
-- ----------------------------------------------------------------------------
local function btnOnPressHandler(event)
    local userid = frmUsername.text
    local password = frmPassword.text

    print(userid)
    print(password)

    -- stop if fields are blank
    if(userid == '' or password == '') then
        labelReturnStatus.text = 'A username or password is required.'
        return
    end

    local URL = "http://opensourcemarketer.com/json.php?userid=" .. mime.b64(userid) .. "&password=" .. mime.b64(password);

    -- debug
    print(URL)

    -- call callback function
    network.request( URL, "GET", loginCallback )
end

-- handle onDrag
local function btnOnDragHandler(event)
    -- do something
end

-- handle onRelease
local function btnOnReleaseHandler(event)
    -- do something
end

-- create button
local btn = widget.newButton(
    {
        width = 250,
        height = 50,
        defaultFile = "media/images/login-btn.png",
        overFile = "media/images/login-btn.png",
        onPress = btnOnPressHandler,
        onDrag = btnOnDragHandler,
        onRelease = btnOnReleaseHandler
    }
)

btn.x = display.contentCenterX
btn.y = display.contentCenterY + 200
loginScreen:insert(btn)

-- ----------------------------------------------------------------------------
-- END OF LOGIN SCREEN
-- ----------------------------------------------------------------------------

