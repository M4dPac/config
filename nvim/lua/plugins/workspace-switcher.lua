-- Переключатель рабочего крейта для rust-analyzer и ast-grep
local all_crates = {
  "streambridge-auth",
  "streambridge-bridge",
  "streambridge-bus",
  "streambridge-cli",
  "streambridge-fault",
  "streambridge-notifications",
  "streambridge-pipeline",
  "streambridge-security",
  "streambridge-storage",
  "streambridge-core",
  "streambridge-app",
}

-- Пресеты: core всегда включён
local presets = {
  app    = { "streambridge-core", "streambridge-app" },
  bus    = { "streambridge-core", "streambridge-bus" },
  auth   = { "streambridge-core", "streambridge-auth" },
  bridge = { "streambridge-core", "streambridge-bridge" },
  all    = all_crates,
}

local function update_sgignore(active_crates)
  local root = vim.fn.getcwd()
  local path = root .. "/.sgignore"
  local lines = {}

  for _, crate in ipairs(all_crates) do
    local active = false
    for _, a in ipairs(active_crates) do
      if a == crate then active = true; break end
    end
    if not active then
      table.insert(lines, "crates/" .. crate .. "/")
    end
  end

  -- Добавляем статичные игноры
  table.insert(lines, "target/")
  table.insert(lines, "node_modules/")
  table.insert(lines, "docs/")

  local f = io.open(path, "w")
  if f then
    f:write(table.concat(lines, "\n") .. "\n")
    f:close()
    vim.notify("ast-grep: активны " .. table.concat(active_crates, ", "), vim.log.levels.INFO)
  end
end

local function switch_preset(name)
  local preset = presets[name]
  if not preset then
    vim.notify("Неизвестный пресет: " .. name, vim.log.levels.ERROR)
    return
  end
  update_sgignore(preset)
  vim.notify(
    "Переключись в " .. name .. ".\nПерезапусти LSP: :LspRestart",
    vim.log.levels.WARN
  )
end

-- Keymaps: <leader>wa + первая буква пресета
vim.keymap.set("n", "<leader>waa", function() switch_preset("app") end,
  { desc = "Workspace: core + app" })
vim.keymap.set("n", "<leader>wab", function() switch_preset("bus") end,
  { desc = "Workspace: core + bus" })
vim.keymap.set("n", "<leader>war", function() switch_preset("auth") end,
  { desc = "Workspace: core + auth" })
vim.keymap.set("n", "<leader>waw", function() switch_preset("all") end,
  { desc = "Workspace: all crates" })

-- Запустить RA для текущего пресета
vim.keymap.set("n", "<leader>rs", function()
  vim.g.ra_manual = true
  vim.cmd("LspStart rust_analyzer")
  vim.notify("rust-analyzer: запускается...", vim.log.levels.INFO)
end, { desc = "RA: запустить индексацию" })

-- Остановить RA и освободить память
vim.keymap.set("n", "<leader>rq", function()
  vim.g.ra_manual = false
  vim.cmd("LspStop rust_analyzer")
  vim.notify("rust-analyzer: остановлен, память освобождена", vim.log.levels.INFO)
end, { desc = "RA: остановить" })

return {}
