state("Obduction-Win64-Shipping")
{
	bool loadingA : 0x0298D960, 0x768, 0x8, 0x110, 0x48, 0x490;
	///int loadingB : 0x028A9E68, 0x7A0, 0x7B8, 0x8, 0x90, 0x7E0;
}

isLoading
{
	return (current.loadingA);/// || (current.loadingB == 256));
}