FROM osrf/ros:kinetic-desktop-full

ENV USERNAME jairo
RUN apt-get update && apt-get install sudo
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash"
RUN useradd -m $USERNAME && \
	echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
	echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
	chmod 0440 /etc/sudoers.d/$USERNAME && \
	# Replace 1000 with your user/group id
	usermod  --uid 1000 $USERNAME && \
	groupmod --gid 1000 $USERNAME

