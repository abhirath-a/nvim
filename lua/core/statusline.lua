local M = {}



-- Always use Visual bg for mode block
local mode_hl = "Visual"
local normal_hl = "StatuslineNormal"
local muted_hl = "StatuslineMuted"

local highlight_cache = {}

local function to_hex(n)
    if not n then return nil end
    return string.format("#%06x", n)
end

local function get_hl_colors(name)
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name })
    if not ok or vim.tbl_isempty(hl) then
        return { fg = "#ffffff", bg = "#000000" }
    end
    return {
        fg = to_hex(hl.fg),
        bg = to_hex(hl.bg),
    }
end

local function create_highlight(name, opts)
    if highlight_cache[name] then return name end
    vim.api.nvim_set_hl(0, name, opts)
    highlight_cache[name] = true
    return name
end

-- Setup highlights
local function setup_highlights()
    local normal_colors = get_hl_colors("Normal")
    create_highlight(normal_hl, { fg = normal_colors.fg, bg = normal_colors.bg, bold = true })
    create_highlight(muted_hl, { fg = get_hl_colors("Comment").fg or "#888888", bg = normal_colors.bg })

    local diag_errors = get_hl_colors("DiagnosticError")
    create_highlight("StatuslineDiagnosticError", { fg = diag_errors.fg, bg = normal_colors.bg })
    local diag_warn = get_hl_colors("DiagnosticWarn")
    create_highlight("StatuslineDiagnosticWarn", { fg = diag_warn.fg, bg = normal_colors.bg })
    local diag_info = get_hl_colors("DiagnosticInfo")
    create_highlight("StatuslineDiagnosticInfo", { fg = diag_info.fg, bg = normal_colors.bg })
    local diag_hint = get_hl_colors("DiagnosticHint")
    create_highlight("StatuslineDiagnosticHint", { fg = diag_hint.fg, bg = normal_colors.bg })
end

setup_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        highlight_cache = {}
        setup_highlights()
    end,
})

local function get_mode_name()
    local modes = {
        n = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        V = "V-LINE",
        [""] = "V-BLOCK",
        R = "REPLACE",
        c = "COMMAND",
        t = "TERMINAL",
    }
    return modes[vim.api.nvim_get_mode().mode] or "OTHER"
end

local function get_diagnostics()
    local counts = { errors = 0, warnings = 0, info = 0, hints = 0 }
    for _, d in ipairs(vim.diagnostic.get(0)) do
        if d.severity == vim.diagnostic.severity.ERROR then counts.errors = counts.errors + 1 end
        if d.severity == vim.diagnostic.severity.WARN then counts.warnings = counts.warnings + 1 end
        if d.severity == vim.diagnostic.severity.INFO then counts.info = counts.info + 1 end
        if d.severity == vim.diagnostic.severity.HINT then counts.hints = counts.hints + 1 end
    end

    local parts = {}
    if counts.errors > 0 then table.insert(parts, " %#StatuslineDiagnosticError# " .. counts.errors) end
    if counts.warnings > 0 then table.insert(parts, " %#StatuslineDiagnosticWarn# " .. counts.warnings) end
    if counts.info > 0 then table.insert(parts, " %#StatuslineDiagnosticInfo# " .. counts.info) end
    if counts.hints > 0 then table.insert(parts, " %#StatuslineDiagnosticHint#󰌵 " .. counts.hints) end

    return table.concat(parts, "")
end

local git_branch_cache = nil
local function update_git_branch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
    if handle then
        local result = handle:read("*a")
        handle:close()
        if result and result ~= "" then
            git_branch_cache = result:gsub("\n", "")
        else
            git_branch_cache = nil
        end
    end
end

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, { callback = update_git_branch })

local function get_git_branch()
    if git_branch_cache then return " " .. git_branch_cache else return "" end
end

local sep_right = ""

local function get_position()
    return " %l:%c %p%% "
end

local function get_filepath()
    local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
    return (fpath ~= "" and fpath ~= ".") and (fpath .. "/") or ""
end

local function get_filename()
    return vim.fn.expand("%:t")
end

local function get_filetype_and_icon()
    local fname = vim.fn.expand("%:t")
    local ext = vim.fn.expand("%:e")
    local devicons = require("nvim-web-devicons")
    local icon, icon_color = devicons.get_icon_color(fname, ext, { default = true })
    return icon or "", icon_color or "#ffffff"
end

local function create_sep_hl(fg, bg)
    local name = "StatuslineSep_" .. fg:gsub("#", "") .. "_" .. bg:gsub("#", "")
    if not highlight_cache[name] then
        vim.api.nvim_set_hl(0, name, { fg = fg, bg = bg })
        highlight_cache[name] = true
    end
    return name
end

M.statusline = function()
    local mode_name = get_mode_name()
    local branch = get_git_branch()
    local filepath = get_filepath()
    local filename = get_filename()
    local diagnostics = get_diagnostics()
    local position = get_position()
    local icon, icon_color = get_filetype_and_icon()

    local parts = {}
    -- Colors for arrows
    -- After you get the highlight colors:
    local mode_bg = get_hl_colors(mode_hl).bg
    local normal_bg = get_hl_colors("Normal").bg
    local git_bg = get_hl_colors("Normal").fg -- pick any distinct bg you like or derive dynamically
    local git_fg = mode_bg                    -- inverted colors

    -- For example:
    -- create git segment highlight
    local git_hl = "StatuslineGitInverted"
    if not highlight_cache[git_hl] then
        vim.api.nvim_set_hl(0, git_hl, { fg = git_fg, bg = git_bg, bold = true })
        highlight_cache[git_hl] = true
    end

    -- Create arrows
    local sep_mode_to_git = create_sep_hl(mode_bg, git_bg)
    local sep_git_to_file = create_sep_hl(git_bg, normal_bg)

    -- Then, when building parts:
    table.insert(parts, ("%%#%s# %s "):format(mode_hl, mode_name))
    table.insert(parts, ("%%#%s#%s"):format(sep_mode_to_git, sep_right))
    table.insert(parts, ("%%#%s# %s "):format(git_hl, branch))
    table.insert(parts, ("%%#%s#%s"):format(sep_git_to_file, sep_right))

    -- -- Git branch inverted (fg=Normal bg, bg=mode bg)
    -- if branch ~= "" then
    --   local git_hl = "StatuslineGitInverted"
    --   if not highlight_cache[git_hl] then
    --     vim.api.nvim_set_hl(0, git_hl, { fg = normal_bg, bg = mode_bg, bold = true })
    --     highlight_cache[git_hl] = true
    --   end
    --   table.insert(parts, ("%%#%s# %s "):format(git_hl, branch))
    --   -- Arrow to normal bg
    --   table.insert(parts, ("%%#%s#%s"):format(sep_git_to_file, sep_right))
    -- end

    -- File info with icon color + muted text
    table.insert(parts, ("%%#%s# %s "):format(normal_hl, ""))
    if icon then
        local icon_hl = "StatuslineIconColor"
        if not highlight_cache[icon_hl] then
            vim.api.nvim_set_hl(0, icon_hl, { fg = icon_color, bg = normal_bg })
            highlight_cache[icon_hl] = true
        end
        table.insert(parts, ("%%#%s#%s"):format(icon_hl, icon))
    end
    table.insert(parts, ("%%#%s# %s%s "):format(muted_hl, filepath, filename))

    -- Right side separator
    table.insert(parts, "%=")

    -- Cursor position
    table.insert(parts, ("%%#%s# %s "):format(normal_hl, position))
    -- Diagnostics
    if diagnostics ~= "" then
        table.insert(parts, diagnostics)
    end

    return table.concat(parts)
end

local augroup = vim.api.nvim_create_augroup("CustomStatusline", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
    group = augroup,
    pattern = "*",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.require'core.statusline'.statusline()"
    end,
})


return M
