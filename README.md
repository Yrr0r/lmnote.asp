# lmnote.asp
Leave me a note .asp

This is a simple small ASP applet that enables you to leave notes onto server and view them, especially when you are unable to send message from smartphone to a computer in today's walled gardens.

**Chinese may not be saved to file correctly in many occations.**

**This applet is only designed for assist in dev enviromment, usually in a small local network when all device is trusted. If you open this applet to the public internet then be prepared for a flooded notes folder and all sorts of attack.** There is no feature like authentication or password protection in this very small applet.

### Usage

Just drop the lmnote folder anywhere you want it and then you can try it. The name of the "lmnote" folder does not matter, you can change it to whatever you prefer.

You can even just drop the Default.asp and/or rename it. 

### This applet has its only config: 

Open the ASP file and you will see on the 2nd line:

```vbscript
const SUBDIR="notes"
```

This means it puts all note files into "notes" folder in its directory. (create if not exist.) You can change the value to whatever you prefer. But no directory strings here, just a name for the subfolder.

------

The default name of the file is the date/time in seconds accuracy. 

------

Contributing:

Already finalised. Want more features? Fork it and DIY.

