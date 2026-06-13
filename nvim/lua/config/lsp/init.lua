local lsp_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "lsp")

vim.filetype.add({
  filename = {
    ["compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
  },
})

local files = vim.fn.readdir(lsp_dir)
table.sort(files)

for _, file_name in ipairs(files) do
  if file_name:sub(-4) == ".lua" and file_name ~= "init.lua" then
    local server_name = file_name:sub(1, -5)
    local ok, server_config = pcall(require, "lsp." .. server_name)

    if ok and type(server_config) == "table" then
      local configured_name = server_config.name or server_name
      server_config.name = nil

      vim.lsp.config(configured_name, server_config)
      vim.lsp.enable(configured_name)
    else
      vim.notify(
        string.format("Failed to load LSP config for %s", server_name),
        vim.log.levels.ERROR
      )
    end
  end
end