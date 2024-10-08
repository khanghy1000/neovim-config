local M = {}

---@param buf number?
function M.bufremove(buf)
  buf = buf or 0
  buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

  if vim.bo.modified then
    local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
    if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
      return
    end
    if choice == 1 then -- Yes
      vim.cmd.write()
    end
  end

  for _, win in ipairs(vim.fn.win_findbuf(buf)) do
    vim.api.nvim_win_call(win, function()
      if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
        return
      end
      -- Try using alternate buffer
      local alt = vim.fn.bufnr '#'
      if alt ~= buf and vim.fn.buflisted(alt) == 1 then
        vim.api.nvim_win_set_buf(win, alt)
        return
      end

      -- Try using previous buffer
      local has_previous = pcall(vim.cmd, 'bprevious')
      if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
        return
      end

      -- Create new listed buffer
      local new_buf = vim.api.nvim_create_buf(true, false)
      vim.api.nvim_win_set_buf(win, new_buf)
    end)
  end
  if vim.api.nvim_buf_is_valid(buf) then
    pcall(vim.cmd, 'bdelete! ' .. buf)
  end
end

function M.get_os_name()
  local is_windows = vim.fn.has 'win64' == 1 or vim.fn.has 'win32' == 1 or vim.fn.has 'win16' == 1
  if is_windows then
    return 'Windows'
  else
    local uname_output = vim.fn.system 'uname'
    return string.gsub(uname_output, '\n', '')
  end
end

local function get_open_cmd(path)
  if vim.fn.has 'mac' == 1 then
    return { 'open', path }
  elseif vim.fn.has 'win32' == 1 then
    if vim.fn.executable 'rundll32' == 1 then
      return { 'rundll32', 'url.dll,FileProtocolHandler', path }
    else
      return nil, 'rundll32 not found'
    end
  elseif vim.fn.executable 'explorer.exe' == 1 then
    return { 'explorer.exe', path }
  elseif vim.fn.executable 'xdg-open' == 1 then
    return { 'xdg-open', path }
  else
    return nil, 'no handler found'
  end
end

function M.open_external(path)
  if vim.ui.open then
    vim.ui.open(path)
    return
  end

  local cmd, err = get_open_cmd(path)
  if not cmd then
    vim.notify(string.format('Could not open %s: %s', path, err), vim.log.levels.ERROR)
    return
  end
  local jid = vim.fn.jobstart(cmd, { detach = true })
  assert(jid > 0, 'Failed to start job')
end

function M.is_non_text_file(filename)
  local _, ext = string.match(filename, '^(.+)%.([^%.\\/]+)$')
  if not ext then
    return false
  end
  local non_text_exts = {
    -- documents
    'pdf',
    'doc',
    'docx',
    'xls',
    'xlsx',
    'ppt',
    'pptx',
    -- images
    'jpg',
    'jpeg',
    'png',
    'gif',
    'svg',
    'webp',
    'ico',
    'bmp',
    -- videos
    'mp3',
    'mp4',
    'avi',
    'mkv',
    -- archives
    'zip',
    'tar',
    'gz',
    'xz',
    'bz2',
    'rar',
    '7z',
  }
  for _, non_text_ext in ipairs(non_text_exts) do
    if ext == non_text_ext then
      return true
    end
  end
  return false
end

return M
