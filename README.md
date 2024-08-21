# External Component to install.

- ripgrep
- fd
- lazygit
- xclip
- nodejs
- go
- python
- pynvim
- ruby

config directory should be for configuration code which don't want Lazy to run as plugin.
If possible, configuration  code should be under `config` function under plugin.

For special case like `dap-js.lua`, due to I decide to struct the packages according to language but for dap js,
they don't have dedicate plugin for dap only have dap configuration for js. So I decide to move the configuration code
to dap package in config directory
