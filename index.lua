-----------------------------------------------------------------------------------------
--
-- index.lua
--
-----------------------------------------------------------------------------------------

local widget = require "widget"
local color = require("convertcolor")
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	--
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(color.rgb(30, 30, 30) )	-- white

    -- Function to handle button events
    local function handleButtonEvent1( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene( "view1" )
        end
    end
    local function handleButtonEvent2( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene( "view3" )
        end
    end
    local function handleButtonEvent3( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene( "view2" )
        end
    end

    local action1 = widget.newButton(
        {
            width = 240,
            height = 94,
            defaultFile = "search-product.png",
            overFile = "search-product.png",
            onEvent = handleButtonEvent1
        }
    )
    local action2 = widget.newButton(
        {
            width = 240,
            height = 94,
            defaultFile = "product-list.png",
            overFile = "product-list.png",
            onEvent = handleButtonEvent2
        }
    )
    local action3 = widget.newButton(
        {
            width = 240,
            height = 94,
            defaultFile = "add-product.png",
            overFile = "add-product.png",
            onEvent = handleButtonEvent3
        }
    )

    -- Center the button
    action1.x = display.contentCenterX
    action1.y = display.contentCenterY - 150
    action2.x = display.contentCenterX
    action2.y = display.contentCenterY - 56
    action3.x = display.contentCenterX
    action3.y = display.contentCenterY + 38

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( action1 )
	sceneGroup:insert( action2 )
	sceneGroup:insert( action3 )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		--
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	--
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene