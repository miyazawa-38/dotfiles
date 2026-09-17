-- snacks の dashboard はヘッダーを行ごとに中央揃えするため、行の幅が違うと崩れる。
-- アスキーアートを差し替えるときなど、行末を空白で埋めて幅を揃えたい場合は
-- 以下のコメントを外し、header を pad_lines([[ ... ]]) のように囲む。
-- ※ 揃えるのは行末だけなので、行頭の空白が消えている場合は直らない。
--
-- local function pad_lines(s)
--   local lines = vim.split(s, "\n", { plain = true })
--   local width = 0
--   for _, line in ipairs(lines) do
--     width = math.max(width, vim.fn.strdisplaywidth(line))
--   end
--   for i, line in ipairs(lines) do
--     lines[i] = line .. string.rep(" ", width - vim.fn.strdisplaywidth(line))
--   end
--   return table.concat(lines, "\n")
-- end

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
     .-') _   ('-.                     (`-.           _   .-')    
    ( OO ) )_(  OO)                  _(OO  )_        ( '.( OO )_  
,--./ ,--,'(,------. .-'),-----. ,--(_/   ,. \ ,-.-') ,--.   ,--.)
|   \ |  |\ |  .---'( OO'  .-.  '\   \   /(__/ |  |OO)|   `.'   | 
|    \|  | )|  |    /   |  | |  | \   \ /   /  |  |  \|         | 
|  .     |/(|  '--. \_) |  |\|  |  \   '   /,  |  |(_/|  |'.'|  | 
|  |\    |  |  .--'   \ |  | |  |   \     /__),|  |_.'|  |   |  | 
|  | \   |  |  `---.   `'  '-'  '    \   /   (_|  |   |  |   |  | 
`--'  `--'  `------'     `-----'      `-'      `--'   `--'   `--' 
]],
        },
      },
    },
  },
}
