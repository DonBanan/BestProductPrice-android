-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local widget = require "widget"
local color = require("convertcolor")
local composer = require( "composer" )
local scene = composer.newScene()
local searchField
local serchText

function scene:create( event )
	local sceneGroup = self.view
	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(color.rgb(30, 30, 30) )	-- white
	
	-- create title scene
	local title = display.newText( "Search product", display.contentCenterX, 170, 'Marvin.otf', 42 )
	title:setFillColor( 1 )

	-- create back button
    local function backButtonEvent( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene( "index" )
            print( "Button was pressed and released" )
        end
    end

    local back_btn = widget.newButton(
        {
            width = 150,
            height = 50,
            defaultFile = "media/images/btn-back.png",
            overFile = "media/images/btn-back.png",
            onEvent = backButtonEvent
        }
    )

	back_btn.x = display.contentCenterX + 10
    back_btn.y = title.y + 100

	-- create search button
	local function searchButtonEvent( event )
        if ( "ended" == event.phase ) then
            print( "Искать: " .. serchText)
        end
    end

	local search_btn = widget.newButton(
        {
            width = 250,
            height = 50,
            defaultFile = "media/images/search-btn.png",
            overFile = "media/images/search-btn.png",
            onEvent = searchButtonEvent
        }
    )

	search_btn.x = display.contentCenterX
    search_btn.y = display.contentCenterY + 100

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( title )
	sceneGroup:insert( back_btn )
	sceneGroup:insert( search_btn )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
	elseif phase == "did" then
		-- create search input
		local function searchListener( event )
			if ( event.phase == "ended" or event.phase == "submitted" ) then
				serchText = event.target.text
			end
		end

		local rect_search = display.newRect( display.contentCenterX, display.contentCenterY, display.contentCenterX, 40 )
		rect_search:setFillColor( 1)

		-- Create text field
		searchField = native.newTextField( display.contentCenterX, display.contentCenterY, display.contentCenterX, 40 )
		searchField:setTextColor( 0 )
		searchField.hasBackground = false
		searchField:addEventListener( "userInput", searchListener )

		sceneGroup:insert( rect_search )
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
	elseif phase == "did" then
		display.remove(searchField)
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