-- Flak Gun

SWEP.PrintName = "#weapon_ov_flak"
SWEP.UseHands = true

SWEP.ViewModelFOV = 58
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"

SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "OV_Flak"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 2
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true
SWEP.BounceWeaponIcon = false
SWEP.DrawWeaponInfoBox = false


-- Initialize the weapon
function SWEP:Initialize()

    self:SetHoldType( "revolver" )

end


-- Primary attack
function SWEP:PrimaryAttack()

	if ( !self:CanPrimaryAttack() ) then return end

	self.Weapon:EmitSound( "weapons/357_fire2.wav", 75, 60, 1 )
	
	self:ShootBullet( 50, 6, 0.06 )
	
	self:TakePrimaryAmmo( 1 )
	
	self.Owner:ViewPunch( Angle( -12, 0, 0 ) )

	self:SetNextPrimaryFire( CurTime() + 1 )

end


-- Secondary attack
function SWEP:SecondaryAttack()

    return

end


-- Shoot bullets
function SWEP:ShootBullet( damage, num_bullets, aimcone )

	local bullet = {}
	bullet.Num 		= num_bullets
	bullet.Src 		= self.Owner:GetShootPos()
	bullet.Dir 		= self.Owner:GetAimVector()
	bullet.Spread 	= Vector( aimcone, aimcone, 0 )
	bullet.Tracer	= 1
	bullet.TracerName = "flaktracer"
	bullet.Force	= 50
	bullet.Damage	= damage
	bullet.AmmoType = "OV_Flak"

	self.Owner:FireBullets( bullet )

	self:ShootEffects()

end


if ( CLIENT ) then

	-- Draw the weapon selection box
	function SWEP:DrawWeaponSelection( x, y, w, h, a )
	
		draw.RoundedBox( 6, x, y, w, h, Color( 0, 0, 100, a - 100 ) )
	
		surface.SetFont( "HL2MPTypeDeath" )
		surface.SetTextColor( 255, 255, 255, a )
		surface.SetTextPos( x + ( w / 3 ), y + ( h / 2.5 ) )
		surface.DrawText( "." )
	
	end

end
