local dashboard = require('alpha.themes.dashboard')

-- Top 
local banner = {
[[      ___           ___                                                            ___     ]],
[[     /__/|         /  /\          ___       ___           ___        ___          /__/\    ]],
[[    |  |:|        /  /::\        /  /\     /  /\         /__/\      /  /\        |  |::\   ]],
[[    |  |:|       /  /:/\:\      /  /:/    /  /:/         \  \:\    /  /:/        |  |:|:\  ]],
[[  __|  |:|      /  /:/~/::\    /  /:/    /__/::\          \  \:\  /__/::\      __|__|:|\:\ ]],
[[ /__/\_|:|____ /__/:/ /:/\:\  /  /::\    \__\/\:\__   ___  \__\:\ \__\/\:\__  /__/::::| \:\]],
[[ \  \:\/:::::/ \  \:\/:/__\/ /__/:/\:\      \  \:\/\ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/]],
[[  \  \::/~~~~   \  \::/      \__\/  \:\      \__\::/ `  \:\|  |:|     \__\::/  \  \:\      ]],
[[   \  \:\        \  \:\           \  \:\     /__/:/   `  \:\__|:|     /__/:/    \  \:\     ]],
[[    \  \:\        \  \:\           \__\/     \__\/     `  \::::/      \__\/      \  \:\    ]],
[[     \__\/         \__\/                                ` ~~~~~                   \__\/    ]],
}
dashboard.section.header.val = banner

-- Center Menu
dashboard.section.buttons.val = {
	dashboard.button('n', '  New file', ':ene <BAR> startinsert<CR>'),
	dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
	dashboard.button('h', '  File History', ':Telescope oldfiles<CR>'),
	dashboard.button('e', '  Explore', ':NvimTreeToggle<CR>'),
	dashboard.button('q', '  Quit', ':qa<CR>'),
}

-- Bottom
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return "kativen" .. " - " .. print_version .. ' - ' .. datetime
end

dashboard.section.footer.val = footer()

require("alpha").setup(dashboard.config)

vim.keymap.set('n', '<leader>;', ":Alpha<CR>", {})
