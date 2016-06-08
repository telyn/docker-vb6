FROM telyn/wine-vcrun6
MAINTAINER telyn <telyn@aetheria.co.uk>

ARG KEY
ARG STF

USER wine
ENV HOME /home/wine
ENV WINEPREFIX /home/wine/.wine
ENV WINEARCH win32
WORKDIR /home/wine

# copy visual studio sources... 
COPY vs vs/
# copy SETUP into root of VS sources (needed for acmsetup)
COPY vs/SETUP vs/

# copy the stf (installer template) we're working with
COPY ${STF:-VB6.STF} vs/ACMSETUP.STF

COPY install.sh .
RUN rm -r /tmp/.wine-1000
RUN ./install.sh $KEY
