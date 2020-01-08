-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local widget = require "widget"
local composer = require( "composer" )
local color = require("convertcolor")
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

	-- create some text
	local title = display.newText( "Product list", display.contentCenterX, 170, 'Marvin.otf', 42 )
	title:setFillColor( 1 )

	local newTextParams = { text = "Loaded product list",
							x = display.contentCenterX + 10,
							y = title.y + 215,
							width = 310,
							height = 310,
							font = native.systemFont,
							fontSize = 14,
							align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 1 )

    local function backButtonEvent( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene( "index" )
            print( "Button was pressed and released" )
        end
    end

    local back_btn = widget.newButton(
        {
            width = 50,
            height = 50,
            defaultFile = "btn-back.png",
            overFile = "btn-back.png",
            onEvent = backButtonEvent
        }
    )

	back_btn.x = display.contentCenterX - 200
    back_btn.y = display.contentCenterY - 460

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
	sceneGroup:insert( back_btn )
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
