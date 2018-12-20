# Initialize
FROM python:3
LABEL maintainer="Louis T. Getterman IV, GotGet <Docker+noVNC@GotGetLLC.com>"
LABEL "com.gotgetllc.vendor"="GotGet, LLC"

# Install
WORKDIR /usr/src/app
RUN \
	apt-get update \
	&& \
	apt-get install --yes \
		net-tools \
	&& \
	pip install --no-cache-dir \
		numpy \
	&& \
	git clone --branch v1.1.0-alpha https://github.com/novnc/noVNC.git /usr/src/app/noVNC \
	&& \
	git clone https://github.com/novnc/websockify /usr/src/app/noVNC/utils/websockify \
	&& \
	cd /usr/src/app/noVNC/utils/websockify && git checkout f0bdb0a621a4f3fb328d1410adfeaff76f088bfd

# Run-time
ENTRYPOINT [ "bash", "/usr/src/app/noVNC/utils/launch.sh" ]
