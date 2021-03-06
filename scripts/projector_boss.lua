	include "toolKit.lua"

	piecesTable={}
	 piecesTable[#piecesTable+1]= piece("center")
	 piecesTable[#piecesTable+1]= piece("Body")
	 piecesTable[#piecesTable+1]= piece("legfront02")
	 piecesTable[#piecesTable+1]= piece("frblade02")
	 piecesTable[#piecesTable+1]= piece("legrear02")
	 piecesTable[#piecesTable+1]= piece("rblade02")
	 piecesTable[#piecesTable+1]= piece("legrear01")
	 piecesTable[#piecesTable+1]= piece("rblade01")
	 piecesTable[#piecesTable+1]= piece("legfront01")
	 piecesTable[#piecesTable+1]= piece("frblade01")
	 piecesTable[#piecesTable+1]= piece("armup01")

	 piecesTable[#piecesTable+1]= piece("bladeup01")

	 piecesTable[#piecesTable+1]= piece("armup02")

	 piecesTable[#piecesTable+1]= piece("bladeup02")

	 piecesTable[#piecesTable+1]= piece("turret")
	 piecesTable[#piecesTable+1]= piece("gun01")
	 piecesTable[#piecesTable+1]= piece("gun02")
	 piecesTable[#piecesTable+1]= piece("gun03")
	 piecesTable[#piecesTable+1]= piece("gun04")
	center=piece("center")
	Body=piece("Body")

	legfront02=piece("legfront02")
	frblade02=piece("frblade02")
	legrear02=piece("legrear02")
	rblade02=piece("rblade02")
	legrear04=piece("legrear04")
	legrear03=piece("legrear03")
	legrear01=piece("legrear01")
	rblade03=piece("rblade03")
	rblade04=piece("rblade04")
	rblade01=piece("rblade01")
	legfront01=piece("legfront01")
	frblade01=piece("frblade01")
	armup01=piece("armup01")
	bladeup01=piece("bladeup01")
	armup02=piece("armup02")
	bladeup02=piece("bladeup02")

	turret=piece("turret")
	gun01=piece("gun01")
	gun02=piece("gun02")
	gun03=piece("gun03")
	gun04=piece("gun04")

	boolStunned=false
	boolAiming=false

	function script.HitByWeapon ( x, z, weaponDefID, damage ) 
	StartThread(stunDetect)
	end
	
	
	
	function stunDetect()
	Sleep(50)
	  health,   maxHealth,   paralyzeDamage,   captureProgress,   buildProgress=Spring.GetUnitHealth(unitID)
		while health < paralyzeDamage do
		boolStunned=true
		Sleep(500)
		health,   maxHealth,   paralyzeDamage,   captureProgress,   buildProgress=Spring.GetUnitHealth(unitID)
		end

	end


	function stunned()
		decrease=44
		while decrease > 1 do
		--contract spasm
		tP(legfront02,math.random(-10,10),0,0,5)
		tP(legfront01,math.random(-10,10),0,0,5)
		tP(legrear01,math.random(-10,10),0,0,5)
		tP(legrear02,math.random(-10,10),0,0,5,true)	
		
			tP(legfront01,x_axis,-1*decrease,5)
			tP(legfront02,x_axis,-1*decrease,5)
			tP(frblade01,x_axis,decrease,5)
			tP(frblade02,x_axis,decrease,5)
			tP(legrear01,x_axis,decrease,5)
			tP(legrear02,x_axis,decrease,5)
			tP(rblade01,x_axis,-1*decrease,5)
			tP(rblade02,x_axis,-1*decrease,5)

		decrease=decrease*-1
			if maRa()==true then
				for i=1, 5 do
				tP(frblade01,math.random(-10,10)+decrease,0,0,5)
				tP(frblade02,math.random(-10,10)+decrease,0,0,5)
				tP(rblade01,math.random(-10,10)+decrease,0,0,5)
				tP(rblade02,math.random(-10,10)+decrease,0,0,5)
				end
			end

		--release
		equiTurn(bladeup01,armup01,x_axis,math.random(decrease,-1*decrease),4.5)
		equiTurn(bladeup02,armup02,x_axis,math.random(decrease,-1*decrease),4.5)
		equiTurn(frblade02,legfront02,x_axis,math.random(-10,0)+decrease,4.5)
		equiTurn(frblade01,legfront01,x_axis,math.random(-10,0)+decrease,4.5)
		equiTurn(legrear01,rblade01,x_axis,math.random(-10,0)+decrease,4.5)
		equiTurn(legrear02,rblade02,x_axis,math.random(-10,0)+decrease,4.5)
		Sleep(500)
		
		tP(legfront02,math.random(-10,10),0,0,5)
		tP(legfront01,math.random(-10,10),0,0,5)
		tP(legrear01,math.random(-10,10),0,0,5)
		tP(legrear02,math.random(-10,10),0,0,5,true)	
		
		decrease=decrease*-1
		decrease=decrease/2
		Sleep(100)
		end
		
		piq=3.14159*0.45
			while boolStunned==true do
			temp_O_Rary=math.random(11,11.5)*piq
				waveATable(piecesTable, x_axis,  math.sin, 1, 0.14, 6.2831853071,8.5, false,temp_O_Rary)
			Sleep(1000)
			end
		reseT(piecesTable,15)

	end


	function walkAnimation()


		while true do
				while boolMove==true do
					Sleep(100)
					tP(legfront01,-15,-33,0, 5,false)
					tP(frblade01,64,0,0, 5,false)
					tP(legrear02,-59,0,0, 5,false)
					tP(legrear04,-59,0,0, 5,false)
					tP(rblade02,89,0,0, 5,false)
					tP(rblade04,89,0,0, 5,false)
					resetPiece(legfront02,5)
					resetPiece(frblade02,5)
					resetPiece(legrear01,5)
					resetPiece(legrear03,5)
					resetPiece(rblade03,5)
					resetPiece(rblade01,5,true)
					
						if boolAiming==false then
						tP(armup01,-5,0,0, 0.25,false)
						tP(armup02,-5,0,0, 0.25,false)	
						end
					Sleep(100)
					tP(legfront02,-15,-33,0, 5,false)
					tP(frblade02,64,0,0, 5,false)
					tP(legrear01,-59,0,0, 5,false)
					tP(legrear03,-59,0,0, 5,false)
					tP(rblade03,89,0,0, 5,false)
					tP(rblade01,89,0,0, 5,false)
					resetPiece(legfront01,5)
					resetPiece(frblade01,5)
					resetPiece(legrear04,5)
					resetPiece(legrear02,5)
					resetPiece(rblade04,5)
					resetPiece(rblade02,5,true)
					
					if boolAiming==false then
					tP(armup01,15,0,0, 0.25,false)
					tP(armup02,15,0,0, 0.25,false)	
					end

					while boolStunned==true do
					stunned()
					end
				end
			
				
				
				while boolMove==false do
				
				--idle

				tP(legfront01,-4,0,0, 0.25,false)
				tP(legfront02,-4,0,0, 0.25,false)
				tP(frblade01,4,0,0, 0.25,false)
				tP(frblade02,4,0,0, 0.25,false)
				
				tP(legrear01,4,0,0, 0.25,false)
				tP(legrear03,4,0,0, 0.25,false)
				tP(legrear04,4,0,0, 0.25,false)
				tP(legrear02,4,0,0, 0.25,false)
				tP(rblade04,-4,0,0, 0.25,false)
				tP(rblade01,-4,0,0, 0.25,false)
				tP(rblade03,-4,0,0, 0.25,true)
				tP(rblade02,-4,0,0, 0.25,true)
				if boolAiming==false then
					tP(armup01,5,0,0, 0.05,false)
					tP(armup02,5,0,0, 0.05,false)	
				end
				Move(center,y_axis,-5,2)
				Sleep(100)
				tP(legfront01,-4*-1,0,0, 0.25,false)
				tP(legfront02,-4*-1,0,0, 0.25,false)
				tP(frblade01,4*-1,0,0, 0.25,false)
				tP(frblade02,4*-1,0,0, 0.25,false)
				
				tP(legrear01,4*-1,0,0, 0.25,false)
				tP(legrear03,4*-1,0,0, 0.25,false)
				tP(legrear02,4*-1,0,0, 0.25,false)
				tP(legrear04,4*-1,0,0, 0.25,false)
				tP(rblade03,-4*-1,0,0, 0.25,false)
				tP(rblade04,-4*-1,0,0, 0.25,false)
				tP(rblade01,-4*-1,0,0, 0.25,false)
				tP(rblade02,-4*-1,0,0, 0.25,true)
				if boolAiming==false then
					tP(armup01,10,0,0, 0.05,false)
					tP(armup02,10,0,0, 0.05,false)	
				end
				Move(center,y_axis,0,1)
				Sleep(100)
					while boolStunned==true do
					stunned()
					end
				end


			Sleep(100)
		end



	end



	--Here we specify what type of robot we got





	 
	function script.Create()
             
	Hide(gun01   )               
	Hide(gun02   )               
	Hide(gun03   )               



	StartThread(walkAnimation)
             
	end


	function script.StartMoving()
	boolMove=true
	end

	function script.StopMoving()
	boolMove=false		
			
	end

	function script.Activate()

	return 1
	end

	function script.Deactivate()

	return 0
	end

	function script.QueryBuildInfo() 
	  return center 
	end

	function script.QueryNanoPiece()
		 return center
	end
	
	function DeathAnimation()
	tP(legfront01,x_axis,-44,3)
	tP(legfront02,x_axis,-44,3)
	tP(frblade01,x_axis,44,3)
	tP(frblade02,x_axis,44,3)
	tP(legrear01,x_axis,44,3)
	tP(legrear02,x_axis,44,3)
	tP(rblade01,x_axis,-44,3)
	tP(rblade02,x_axis,-44,3)
	tP(center,z_axis,-90,8,true)

	end

	function script.Killed(recentDamage,_)


	DeathAnimation()
	return 1
	end
	SIG_RESET=2

	function resetTurret()
	Sleep(1000)
	SetSignalMask(SIG_RESET)
	resetPiece(turret,5)
	
	end


	----Weapon1
	function script.AimFromWeapon1() return turret end

	function script.QueryWeapon1() 	return turret end

	function script.AimWeapon1( Heading ,pitch)	
	
		Signal(SIG_RESET)
		boolAiming=true
		
		Turn(armup01,x_axis,pitch,19)
		Turn(turret,y_axis,-Heading,19)
		Turn(armup02,x_axis,pitch,19,true)
		return true
	end
	 
	 function script.FireWeapon1()	boolAiming=false; Signal(SIG_RESET); StartThread(resetTurret);return true; end

         
         
    -- copy pasted 
	function script.AimFromWeapon2() return turret end

	function script.QueryWeapon2() 	return turret end

	function script.AimWeapon2( Heading ,pitch)	
	
		Signal(SIG_RESET)
		boolAiming=true
		
		Turn(armup01,x_axis,pitch,19)
		Turn(turret,y_axis,-Heading,19)
		Turn(armup02,x_axis,pitch,19,true)
		return true
	end
	 
	 function script.FireWeapon2()	boolAiming=false; Signal(SIG_RESET); StartThread(resetTurret);return true; end
         
         
         -- copy pasted 
         
    function script.AimFromWeapon3() return turret end

	function script.QueryWeapon3() 	return turret end

	function script.AimWeapon3( Heading ,pitch)	
	
		Signal(SIG_RESET)
		boolAiming=true
		
		Turn(armup01,x_axis,pitch,19)
		Turn(turret,y_axis,-Heading,19)
		Turn(armup02,x_axis,pitch,19,true)
		return true
	end
	 
	 function script.FireWeapon3()	boolAiming=false; Signal(SIG_RESET); StartThread(resetTurret);return true; end