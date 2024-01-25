FROM archlinux:multilib-devel

ARG user="max"

RUN pacman -Sy --noconfirm curl git make sudo
RUN useradd -ms /bin/bash $user 
RUN usermod -aG wheel $user
RUN echo 'max ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER max
WORKDIR /home/$user

# Rust
RUN sudo pacman -Sy --noconfirm rustup && rustup default nightly

# Yay AUR helper
RUN sudo pacman -S --noconfirm --needed git base-devel 
RUN cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && yes | makepkg -si

# OPAM
RUN yes | sudo pacman -S opam 
RUN opam init --disable-sandboxing
RUN echo "test -r /home/max/.opam/opam-init/init.sh && . /home/max/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true" > ~/.bash_profile
RUN echo 'eval $(opam env)' > ~/.bash_profile

# Pumpkin Pi / Coq 8.9 Setup
# RUN opam switch create coq-8.9.1 4.09.1
# RUN opam -y pin add coq 8.9.1
# RUN git clone https://github.com/uwplse/pumpkin-pi.git /tmp/pumpkin-pi
# RUN cd /tmp/pumpkin-pi && cd plugin && bash build.sh
