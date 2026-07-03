local ns = vim.api.nvim_create_namespace('indent_guides')
local timers = {}

local function update(bufnr)
    if not vim.api.nvim_buf_is_valid(bufnr) then return end
    if vim.bo[bufnr].buftype ~= '' then return end

    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local sw = vim.bo[bufnr].shiftwidth
    if sw == 0 then sw = vim.o.shiftwidth end

    local function indent_of(line)
        return #(line:match('^(%s*)') or '')
    end

    for i, line in ipairs(lines) do
        if not line:match('^%s*$') then goto continue end

        local prev, nxt = 0, 0
        for j = i - 1, 1, -1 do
            if not lines[j]:match('^%s*$') then
                prev = indent_of(lines[j])
                break
            end
        end
        for j = i + 1, #lines do
            if not lines[j]:match('^%s*$') then
                nxt = indent_of(lines[j])
                break
            end
        end

        local level = math.min(prev, nxt)
        if level == 0 then level = math.max(prev, nxt) end
        if level == 0 then goto continue end

        local virt = {}
        for seg = 0, math.ceil(level / sw) - 1 do
            table.insert(virt, { seg == 0 and '│' or (string.rep(' ', sw - 1) .. '│'), 'NonText' })
        end

        vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, 0, {
            virt_text = virt,
            virt_text_pos = 'overlay',
            hl_mode = 'combine',
        })

        ::continue::
    end
end

local function schedule(bufnr)
    if timers[bufnr] then timers[bufnr]:stop() end
    timers[bufnr] = vim.defer_fn(function()
        timers[bufnr] = nil
        update(bufnr)
    end, 50)
end

local group = vim.api.nvim_create_augroup('IndentGuides', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'TextChanged', 'TextChangedI' }, {
    group = group,
    callback = function(ev) schedule(ev.buf) end,
})
