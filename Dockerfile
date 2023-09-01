FROM h4rkon/python-base:latest

USER root

COPY dockerfile-key /root/.ssh/id_rsa
# Set the correct permissions on the SSH key
RUN chmod 600 /root/.ssh/id_rsa && \
    echo "StrictHostKeyChecking no" >> /root/.ssh/config

# Install Vundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/docker/.vim/bundle/Vundle.vim
COPY .vimrc /home/docker/.vimrc
RUN vim +PluginInstall +qall

CMD ["vim"]
