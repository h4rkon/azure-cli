FROM mcr.microsoft.com/azure-cli
RUN apk add vim
COPY .vimrc /root/.vimrc
RUN mkdir /root/.ssh
COPY dockerfile-key /root/.ssh/dockerfile-key
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN rm /root/.ssh/dockerfile-key
CMD ["bash"]
