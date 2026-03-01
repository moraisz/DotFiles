local M = {}

---@param mode string|table
---@param lhs string
---@param rhs string|function
---@param opts table|nil
function M.map(mode, lhs, rhs, opts)
    local options = { silent = false }

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

return M
