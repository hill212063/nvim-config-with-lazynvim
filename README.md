# Dependencies to installed.
- ripgrep
- fd
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

# Language support
| Language | LSP | DAP (debugger) |
|----------|-----|----------------|
| Java     | [x] | [x]            |
| Go       | [x] | [x]            |
| Python   | [x] | [x]            |
| C/C++    | [x] | []             |
| Flutter  | [x] | [x]            |
