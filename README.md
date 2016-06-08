This repo provides the recipe for creating a docker image with VS6 installed under wine, so you can build vb6 projects in gitlab-ci or whatever. I don't know, whatever purpose you might have for it.

To use:

copy your Visual Studio/Visual Basic install media into `vs/`, such that there is a file called `vs/SETUP.EXE`

Then run docker build as follows, replacing YOURKEY_HERE with the numbers of your product key (o hyphen character.

		docker build --build-arg KEY=YOURKEY_HERE .

Eg. for the key 123-7890123, run `docker build --build-arg KEY=1237890123 .`

Cross your fingers. A test is run at the end to check that the VB98 folder exists. If it does, it might work?

For obvious legal reasons, I'm not providing any prebuilt images of this on docker hub nor anywhere else.


If you can't run it as-is with your media you'll probably need to make your own `VB6.STF` file. In your install media, run `SETUP/ACOST.EXE`, then go to File->Open STF File, and open the STF file in the `SETUP/` folder. Tick the things you want to install, untick the things you don't, then File->Save As. Replace `VB6.STF` with your generated STF file and (if you aren't installing VB6) remove the line that checks for VB98's existence at the end of the `install.sh` script.
