# 0.0.1-Oh-My-Dev

### Overview

[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) plugin to post and search articles from the [Dev.to](https://dev.to) platform.
Articles are sourced using the the [Dev.to API](https://docs.dev.to/api/) (currently in BETA)

### Prerequites

- [Jq](https://stedolan.github.io/jq/) - jq is a lightweight and flexible command-line JSON processor. To install run `$ sudo apt install jq` on linux or `brew install jq` on OS X
- Working **zsh** and **oh-my-zsh installation**

### Testing Locally

This plugin is not part of the default plugins that comes with the official Oh My Zsh shell and this means you'll need to
setup locally to be able to use.

- Fork and clone this repository locally to your machine
- Move the directory to your **.oh-my-zsh** plugin directory in `~/.oh-my-zsh/custom/plugin`
- Open your zshrc file `$ nano ~/.zshrc` and add the plugin `plugin=(oh_my_dev)`
- Run `source ~/.zshrc` to effect changes on your current terminal or close and reopen it.

### Basic commands

- `$ oh_my_dev` - This command fetches articles from Dev.to and links for checking them up on the internet
- `$ oh_my_dev <tag name>` - This command fetches all articles tagged  \<tag name\>  on the Dev.to platform
- `$ oh_my_dev make_post - This command is used to create a draft article from the zsh terminal to dev.to
