# Shell Configs

```
git clone https://github.com/wbydc/shell ~/.local/shell
cd ~/.local/shell
bash install.sh
```

## Overview

This repository contains modular shell configuration scripts and utilities for Unix-like environments. It is designed to be easily extensible and portable, providing a convenient way to manage aliases, environment variables, and tool integrations.

## Features

- Modular structure: separate components for aliases, environment variables, and tool-specific configs
- Easy installation and updates
- Custom scripts and third-party tool integrations (e.g., Go, kubectl, nvm)
- POSH-compatible prompt configuration

## Installation

Clone the repository and run the install script:

```bash
git clone https://github.com/wbydc/shell ~/.local/shell
cd ~/.local/shell
bash install.sh
```

You may need to source the main config in your `.bashrc`, `.zshrc`, or equivalent:

```bash
source ~/.local/shell/config.sh
```

## Directory Structure

- `config.sh` – Main entry point for shell configuration
- `install.sh` – Installation script
- `components/` – Modular shell scripts (aliases, env, go, kubectl, etc.)
- `configs/` – Additional configuration files (e.g., keys)
- `custom/` – Place your custom scripts here (not tracked by git)
- `install/` – Tool-specific install scripts
- `posh/` – Prompt configuration files (e.g., for oh-my-posh)

## Customization

Add your own scripts to the `custom/` directory. These will be sourced automatically if present.

## Updating

To update, pull the latest changes and re-run the install script:

```bash
cd ~/.local/shell
git pull
bash install.sh
```

## License

MIT License. See LICENSE file for details.
