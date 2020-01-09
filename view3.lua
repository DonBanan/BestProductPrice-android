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










	_CH = display.contentHeight
	_CW = display.contentWidth

	local t = {}
	t = {
		{ name = "row1", data = "data1"} ,
		{ name = "row2", data = "data2"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row3", dta = "data3"} ,
		{ name = "row100", dta = "data3"} ,
	}

	local ox, oy = math.abs(display.screenOriginX), math.abs(display.screenOriginY)

	local function onRowRender(event)
		local row = event.row
		local rowHeight = row.contentHeight

		row.bg = display.newRect( row, _CW/2, rowHeight/2, _CW, rowHeight)
		row.bg.fill = { color.rgb(30, 30, 30) }

		row.nameText = display.newText{ parent=row, text=row.params.name .. ' - 100', x=_CW/2, y=rowHeight/2, font='Marvin.otf', fontSize=15 }
		row.nameText.x = row.nameText.x + row.nameText.width/2
		row.nameText:setFillColor(1)
	end

	-- Create the widget
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

	-- insert data
	--for i = 1, 72 do
	--	print(i)
	--	tableView:insertRow {
	--		rowHeight= 30,
	--		params = { name = t[i].name}
	--	}
	--end


	local function networkListener( event )
		if ( event.isError ) then
			print( "Network error: ", event.response )
		else
			local myTable = json.decode(event.response)
			for k,v in pairs(myTable) do
				tableView:insertRow {
					rowHeight= 30,
					params = { name = v['name']}
				}
			end
		end
	end

	local ntw = network.request( "https://jsonblob.com/api/435c487b-312a-11ea-b010-e1d0a21e9e61", "GET", networkListener )

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
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
