-- Fix up cs_assault for Virus gameplay

if ( CLIENT ) then return end


function OVMap_PostCleanupMap()

	ents.FindByClass( "prop_door_rotating" )[ 1 ]:Fire( "Open" )
	ents.FindByClass( "prop_door_rotating" )[ 1 ]:Fire( "Kill", "", "1" )

	ents.FindByClass( "prop_door_rotating" )[ 2 ]:Fire( "Open" )
	ents.FindByClass( "prop_door_rotating" )[ 2 ]:Fire( "Kill", "", "1" )

	for _, ent in pairs( ents.FindByClass( "func_breakable" ) ) do
	
		ent:Fire( "SetHealth", "0" )

    end

end
hook.Add( "PostCleanupMap", "OVMap_PostCleanupMap", OVMap_PostCleanupMap )
