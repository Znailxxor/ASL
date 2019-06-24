state("Obduction-Win64-Shipping")
{
	//value is 2 when loading anything, 1 when not
	int isLoadingSteam : "Obduction-Win64-Shipping.exe", 0x030FDC98, 0x188, 0x40, 0x10, 0x30, 0xA0, 0x68, 0xC;
	
	//value is 2 when loading saves, 1 when not
	int isLoadingSteam10 : "Obduction-Win64-Shipping.exe", 0x02951438, 0x188, 0x48, 0x10, 0x30, 0xA0, 0x68, 0xC;
	//value is 256 when loading physical transitions, 0 when not
	int isLoadingTreeSteam10 : "Obduction-Win64-Shipping.exe", 0x0298C300, 0x48, 0x7E0;
	//value is 1 when doing seed transitions, 0 when not (always has a last offset of 0x13C8)
	int isLoadingSeedSteam10 : "Obduction-Win64-Shipping.exe", 0x027E83E8, 0x440, 0x840, 0x13C8;
	//value is 0 in heart, 1 or 4 in intro, 2 or ??? in kaptar/maray, 3 or 7 in hunrath/soria
	int ID : "Obduction-Win64-Shipping.exe", 0x027A5310;
	
	int isLoadingGOG : "Obduction-Win64-Shipping.exe", 0x0309CB18, 0x188, 0x48, 0x10, 0x30, 0xA0, 0x68, 0xC;
}

startup{
	settings.Add("1.7steam", false, "Game is 1.7.0, in Steam");
	settings.Add("1.7gog", false, "Game is 1.7.0, in GOG");
	settings.Add("1.0steam", true, "Game is 1.0, in Steam");
}

isLoading{

	/*
	if(current.isLoadingSteam10 == 2){
		return true;
	}else if(current.isLoadingSteam10 == 0 && current.isLoadingSteam == 2){
		//note - this is STUPID and HACKY 
		return true;
	}else if(current.isLoadingSteam == 0 && current.isLoadingSteam10 == 0 && current.isLoadingGOG == 2){
		return true;
	}else{
		return false;
	}
	*/
	if(settings["1.0steam"] == true){
		//standard load handling
		if(current.isLoadingSteam10 == 2 || current.isLoadingSeedSteam10 == 1){
			return true;
		}else if((current.ID != 1 && current.ID != 4) && (current.isLoadingTreeSteam10 != 0)){
			return true;
		}else{
			return false;
		}
	}else if(settings["1.7steam"] == true && current.isLoadingSteam == 2){
		return true;
	}else if(settings["1.7gog"] == true && current.isLoadingGOG == 2){
		return true;
	}else{
		return false;
	}
}
