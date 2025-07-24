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

## Directory Structure

- `config.sh` – Storage for your configs
- `install.sh` – Installation script
- `components/` – Modular shell scripts (aliases, env, go, kubectl, etc.)
- `install/` – Tool-specific install scripts
- `posh/` – Prompt configuration files (e.g., for oh-my-posh)

## Updating

To update, pull the latest changes and re-run the install script:

```bash
cd ~/.local/shell
git pull
bash install.sh
```

## License

MIT License. See LICENSE file for details.
