bop_bop_mara's vim configuration
================================

Usage
-----

* Clone the repository

        git clone 'https://github.com/bopbopmara/vim.git' ~/.vim

* Create your main `.vimrc` file

        ln -s ~/.vim/vimrc ~/.vimrc

* Install `Vundle`

        mkdir ~/.vim/bundle
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

* Launch `vim` and run `:PluginInstall`

* Install the necessary Python tools

        sudo pip install flake8 isort black

  Do not use `sudo` if you prefer user or virtual environment installation.

  In this case also adjust the `black` virtual environment in `vimrc`:

        let g:black_virtualenv='/path/to/python/env'

* You may also install `pydocstyle`

        sudo pip install pydocstyle

  Make sure you enable the checks in `after/ftplugin/python.vim`:

        let g:syntastic_python_checkers=['flake8', 'pydocstyle']


See also
--------

* [`Vundle`](https://github.com/VundleVim/Vundle.vim)
* [`black`](https://github.com/psf/black)
