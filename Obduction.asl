state("Obduction-Win64-Shipping")
{
	int usingsphere : 0x028C9190, 0x28, 0x280, 0x130, 0x0, 0x5B8;
	int loading: 0x028A9E68, 0x7A0, 0x7B8, 0x8, 0x90, 0x7E0;
}

isLoading
{
	if (current.usingsphere == 0 || current.loading == 256)
	{
		return true;
	}
	else
	{
		return false;
	}
}