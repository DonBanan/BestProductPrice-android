-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local widget = require "widget"
local composer = require( "composer" )
local color = require("convertcolor")
local json = require( "json" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(color.rgb(30, 30, 30) )	-- white

	-- create title scene
	local title = display.newText( "Product list", display.contentCenterX, 170, 'Marvin.otf', 42 )
	title:setFillColor( 1 )

	-- create back button scene
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

	-- create product list
	_CH = display.contentHeight
	_CW = display.contentWidth

	local ox, oy = math.abs(display.screenOriginX), math.abs(display.screenOriginY)

	local function onRowRender(event)
		local row = event.row
		local rowHeight = row.contentHeight

		row.nameText = display.newText{ parent=row, text=row.params.name .. ' - ' .. row.params.price, x=_CW/2, y=rowHeight/2, align = "left", font='Marvin.otf', fontSize=15 }
		row.nameText.x = row.nameText.x + row.nameText.width/2
		row.nameText:setFillColor(1)
	end

	-- Create the widget table
	local tableView = widget.newTableView(
		{
			hideBackground = true,
			top = 300-oy,
			left = -ox,
			width = display.contentWidth+ox+ox,
			height = display.contentHeight+oy+oy-300,
			onRowRender = onRowRender,
			onRowTouch = onRowTouch,
			listener = scrollListener
		}
	)

	local function networkListener( event )
		if ( event.isError ) then
			print( "Network error: ", event.response )
		else
			local myTable = json.decode(event.response)
			for k,v in pairs(myTable) do
				local rowColor = { default={color.rgb(30, 30, 30)}, over={1,0.5,0,0.2} }
    			local lineColor = { 1 }
				tableView:insertRow {
					rowHeight= 30,
					rowColor = rowColor,
            		lineColor = lineColor,
					params = { name = v['name'], price = v['price']}
				}
			end
		end
	end

	network.request( "https://jsonblob.com/api/435c487b-312a-11ea-b010-e1d0a21e9e61", "GET", networkListener )

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( title )
	sceneGroup:insert( back_btn )
	sceneGroup:insert( tableView )
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
