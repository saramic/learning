# Laptop Setup

Laptop setup for ruby/node/rust development

- Base laptop setup
- GUI related extensions
- Text related extensions
- Other extensions
- Outstanding

## Base laptop setup

### For a new laptop

1. start the machine
    1. choose all sain settings for your locale
    1. log into **iCould account** even for work laptop
        > this will allow you to save documents and notes to the cloud which
        > may be helpful for transferring to another machine, a backup,
        > accessing from a phone or the web, finding your device, etc.
1. **System Update**
    1. once fully booted
    1. run a system update `System Preferences -> Software Updates`
       > every new machine is likely to be behind on software updates
1. install command line tools
   ```
   xcode-select --install
   ```
1. **Git**
    1. use the default git that comes with mac
    1. create or bring across your ssh key and make sure it's in gitlab
       [Preferences -> User Settings -> SSH
       Keys](https://gitlab.com/-/profile/keys) as per instructions in
       https://docs.gitlab.com/ee/ssh/#rsa-ssh-keys
     ```
     ssh-keygen -t rsa -b 2048 -C "my UNIQUE NAME key"
     ```
    1. setup sane git defaults
    ```
    git config --global pull.rebase true
    git config --global user.name "Michael Milewski"
    git config --global user.email saramic@gmail.com
    git config --global core.editor "code --wait"
    git config --global --replace-all core.pager "less -F -X"
    ```
    1. review your `~/.gitconfig` file using
    ```
     git config --global --edit

    ```
1. **Brew**
    1. use homebrew to manage most dependencies https://brew.sh
    1. following the instructions from above site, in terminal run something similar to
     ```
       /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     ```
    1. don't forget to do the final step of the previous command to add it to your profile
     ```
     echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
     eval "$(/opt/homebrew/bin/brew shellenv)"
     ```
1. **Projects** directory for all your projects
    ```
    mkdir -p ~/Projects/me
    git clone git@github.com:saramic/learning.git
    cd learning
    make
    make update-dev-env
    ```
