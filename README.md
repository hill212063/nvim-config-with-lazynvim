# Dependencies to installed.
- ripgrep
- fd
- fzf
- make
- lazygit
- xclip
- nodejs
- go
- python
- pynvim
- ruby

# Debugger
If debugger has custom config so it can be configured in `mason-nvim-dap.lua`
but if not then the debugger should has its own config file for example:

- nvim-java, due to it is another plugin not a config so it should seperate as plugin specifig file `nvim-java.lua`.
- flutter-tool, already has debugger configuration part in the plugin.

# Language support
| Language | LSP | DAP (debugger) |
|----------|-----|----------------|
| Java     | yes | yes            |
| Go       | yes | yes            |
| Python   | yes | yes            |
| C/C++    | yes | no             |
| Flutter  | yes | yes            |
