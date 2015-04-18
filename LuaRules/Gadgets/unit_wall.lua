function gadget:GetInfo()
	return {
		name = "Walls",
		desc = "Walls for justice",
		author = "gajop",
		date = "April 2015",
		license = "GNU GPL, v2 or later",
		layer = 1,
		enabled = true
	}
end

local LOG_SECTION = "wall"
local LOG_LEVEL = LOG.NOTICE

if (gadgetHandler:IsSyncedCode()) then

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
    -- boom
    if UnitDefs[unitDefID].customParams.wall then
        Spring.Log(LOG_SECTION, LOG_LEVEL, "Setting wall stuff: " .. tostring(unitID))
        
    	Spring.SetUnitAlwaysVisible(unitID, true);
-- 		Spring.SetUnitCollisionVolumeData(unitID, 0, 0, 0,
-- 											0, 0, 0,
-- 											0, 0, 0 
-- 		);
		Spring.MoveCtrl.SetNoBlocking(unitID)
-- 		Spring.SetUnitPosition(unitID,512,0,512);
		Spring.SetUnitNeutral(unitID, true)
		Spring.MoveCtrl.Enable(unitID)
		Spring.MoveCtrl.SetGravity(unitID,0)
-- 		Spring.MoveCtrl.SetPhysics(unitID,
-- 		   512,-150,512,
-- 		   0,0,0,
-- 		   0,0,0
-- 		);
-- 		
-- 		
-- 		Spring.SetUnitMidAndAimPos ( unitID, 
-- 		   0, 100, 0, 
-- 		   0, 100, 0,
-- 		   true
-- 		);
    end
end

end