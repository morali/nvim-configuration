-- File: lua/core/init.lua

-- Find all .lua files in this directory
local files = vim.fn.glob(vim.fn.stdpath('config') .. '/lua/config/*.lua', true, true)

-- Loop through the files and load them, skipping this init.lua file
for _, file in ipairs(files) do
    local module_name = vim.fn.fnamemodify(file, ':t:r')
    if module_name ~= 'init' then
        require('config.' .. module_name)
    end
end
