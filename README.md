# Dotfiles repo

Created this to have a single source of truth for commands that I tend to use across my different computers.
Please make a fork of this repo first so that you can make changes that work best for you.
While for now it only holds a bashrc file, note that we can put a standard or default gitnore or other parts in here as well.

## How to Use

### 1) Create a Symbolic link

After cloning the repo (I cloned mine to my home directory), to use the file as is, create a symbolic link by doing something like:

```shell
ln -s ~/dotfiles/bashrc ~/.bashrc
```

You can verify that this worked as a link by doing

```shell
ls -l ~/.bashrc
```

If the file shows up with properties like `lrwxrwxrwx` and not like `-rw-r--r--`, then you created a symbolic link.

If this didn't happen, then most likely your OS decided to just make a copy of the file.
Keep that in mind if you make changes in the future.

> *Troubleshooting:* If you get an error because you have an existing bashrc file,
> Open the file and take some time to review your commands along with these commands and make your own modifications to the *dotfiles/bashrc* file in the dotfiles repo.
> Then once you are comfortable, you can remove the *.bashrc* file and try doing the symbolic link again.
>> If you get errors related to not finding the bashrc file, *Make sure to modify your repo path (e.g. `~/git/dotfiles/bashrc`) accordingly*

### 2) Reload the bashrc file contents in terminal

You can reload the bashrc file by opening and closing your terminal window or by typing:

```shell
source ~/.bashrc
```

### Acknowledgements

Much of this is based off work from [Mathias Bynens](https://github.com/mathiasbynens/dotfiles).
This is not a fork of that repo, as it is has many more features than we need for our purposes,
but should you want to tweak your configuration further, it is a good place to start.
