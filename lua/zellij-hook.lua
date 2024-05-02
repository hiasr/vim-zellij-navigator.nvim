local M = {}

function M.setup()
    if os.getenv("ZELLIJ") == nil then
        return
    end

    vim.fn.jobstart('zellij pipe -n "nvim_hook" "open"')
    vim.api.nvim_create_autocmd({"VimLeavePre"}, {
        pattern = {"*"},
        command = 'zellij pipe -n "nvim_hook" "close"'
    })
end

return M
