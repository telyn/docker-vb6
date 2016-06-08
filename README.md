This repo provides the recipe for creating a docker image with VS6 installed under wine, so you can build vb6 projects in gitlab-ci or whatever. I don't know, whatever purpose you might have for it.

Anyway.. This repo will never have an image placed on docker hub or any other public image registry (at least, not by me, because I don't fancy getting cease & desisted by MSFT).

To use:

copy your Visual Studio/Visual Basic install media into `vs/`, such that there is a file called `vs/SETUP.EXE`

Then run docker build as follows, replacing YOURKEY_HERE with the numbers of your product key (o hyphen character.

		docker build --build-arg KEY=YOURKEY_HERE .

Eg. for the key 123-7890123, run `docker build --build-arg KEY=1237890123 .`

Cross your fingers. A test is run at the end to check that the VB98 folder exists. If it does, it might work?

For obvious legal reasons, I'm not providing any prebuilt images of this on docker hub nor anywhere else.
