FROM alpine:3
WORKDIR /tmp/init_build

# Initial installs
RUN apk update && apk add --no-cache curl openrc libuser \
    git zsh gcc python3-dev py3-pip py3-greenlet tmux neovim

# Install github cli - gh
COPY scripts/gh_install.sh scripts/gh_token.txt ./
RUN sh "gh_install.sh"

# Install Oh-My_ZSH
RUN sh -c "$(curl -sSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install vim-plug
RUN mkdir -p /root/.local/share/nvim/site/autoload/
RUN wget -P /root/.local/share/nvim/site/autoload/ \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" 

# Install Python reqs
COPY conf/requirements.txt ./
RUN pip3 install -r requirements.txt

# Copy Config Files
RUN mkdir -p /root/.config/nvim/
COPY conf/init.vim /root/.config/nvim/
COPY conf/dircolors /root/.dircolors
COPY conf/zshrc /root/.zshrc

RUN rm -r /tmp/init_build

WORKDIR /home/work

ENTRYPOINT ["/bin/zsh"]

