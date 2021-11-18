state("BrightMemoryInfinite-Win64-Shipping")
{
    uint loading : 0x04B19438, 0x90, 0x2B0, 0x8, 0x30;
}

init
{
	vars.loading = false;
}   

startup
  {
		if (timer.CurrentTimingMethod == TimingMethod.RealTime)
// Asks user to change to game time if LiveSplit is currently set to Real Time.
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Bright Memory: Infinite",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

update
{ 
//    print(current.loading.ToString());  
	vars.loading = current.loading == 3212836864;
}

isLoading
{
    return vars.loading;
}