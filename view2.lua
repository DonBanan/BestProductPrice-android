-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local widget = require "widget"
local composer = require( "composer" )
local color = require("convertcolor")
local scene = composer.newScene()

local productNameField
local productPriceField
local productLocationNameField
local serchText

function scene:create( event )
	local sceneGroup = self.view

	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(color.rgb(30, 30, 30) )	-- white
	
	-- create title scene
	local title = display.newText( "Add product", display.contentCenterX, 170, 'Marvin.otf', 42 )
	title:setFillColor( 1 )

    local function backButtonEvent( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene( "index" )
            print( "Button was pressed and released" )
        end
    end

	-- create back button scene
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

	-- create send button
	local function createButtonEvent( event )
        if ( "ended" == event.phase ) then
            print( "Создать продукт: " .. serchText)
        end
    end

	local create_btn = widget.newButton(
        {
            width = 250,
            height = 50,
            defaultFile = "media/images/create-btn.png",
            overFile = "media/images/create-btn.png",
            onEvent = createButtonEvent
        }
    )

	create_btn.x = display.contentCenterX
    create_btn.y = display.contentCenterY + 200

	--create google map
	--local myMap = native.newMapView( 20, 20, 280, 360 )
	--myMap.x = display.contentCenterX
	--myMap.y = display.contentCenterY
	--
	---- Display map as vector drawings of streets (other options are "satellite" and "hybrid")
	--myMap.mapType = "standard"
	--
	---- Initialize map to a real location
	--myMap:setCenter( 37.331692, -122.030456 )


	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( title )
	sceneGroup:insert( back_btn )
	sceneGroup:insert( create_btn )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- create search input
		local function searchListener( event )
			if ( event.phase == "ended" or event.phase == "submitted" ) then
				serchText = event.target.text
			end
		end

		local rect_name = display.newRect( display.contentCenterX, display.contentCenterY - 100, display.contentCenterX, 40 )
		rect_name:setFillColor( 1)

		local rect_price = display.newRect( display.contentCenterX, display.contentCenterY - 20, display.contentCenterX, 40 )
		rect_price:setFillColor( 1)

		local rect_location_name = display.newRect( display.contentCenterX, display.contentCenterY + 60, display.contentCenterX, 40 )
		rect_location_name:setFillColor( 1)

		-- Create text field
		local name_product = display.newText( "Name product", display.contentCenterX, display.contentCenterY - 140, 'Marvin.otf', 15 )
		name_product:setFillColor( 1 )
		productNameField = native.newTextField( display.contentCenterX, display.contentCenterY - 100, display.contentCenterX, 40 )
		productNameField:setTextColor( 0 )
		productNameField.hasBackground = false
		productNameField:addEventListener( "userInput", searchListener )

		local price_product = display.newText( "Price product", display.contentCenterX, display.contentCenterY - 60, 'Marvin.otf', 15 )
		price_product:setFillColor( 1 )
		productPriceField = native.newTextField( display.contentCenterX, display.contentCenterY - 20, display.contentCenterX, 40 )
		productPriceField:setTextColor( 0 )
		productPriceField.hasBackground = false
		productPriceField:addEventListener( "userInput", searchListener )

		local name_location = display.newText( "Name location", display.contentCenterX, display.contentCenterY + 20, 'Marvin.otf', 15 )
		name_product:setFillColor( 1 )
		productLocationNameField = native.newTextField( display.contentCenterX, display.contentCenterY + 60, display.contentCenterX, 40 )
		productLocationNameField:setTextColor( 0 )
		productLocationNameField.hasBackground = false
		productLocationNameField:addEventListener( "userInput", searchListener )

		sceneGroup:insert( rect_name )
		sceneGroup:insert( name_product )
		sceneGroup:insert( rect_price )
		sceneGroup:insert( price_product )
		sceneGroup:insert( rect_location_name )
		sceneGroup:insert( name_location )
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
		display.remove(productNameField)
		display.remove(productPriceField)
		display.remove(productLocationNameField)
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
