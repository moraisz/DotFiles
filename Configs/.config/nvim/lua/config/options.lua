local opt = vim.opt
local o = vim.o

-- Interface
opt.number = true               -- linhas numeradas
opt.relativenumber = true       -- números relativos
opt.cursorline = true           -- linha do cursor destacada
opt.signcolumn = "yes"          -- sempre mostrar a coluna de sinais (diagnósticos, Git, etc)
opt.termguicolors = true        -- habilita cores verdadeiras
opt.scrolloff = 8               -- linhas acima/abaixo do cursor
opt.sidescrolloff = 8

-- Tabs & Identação
opt.tabstop = 4                 -- tamanho do tab em espaços
opt.shiftwidth = 4              -- espaços por indentação
opt.expandtab = true            -- converte tab para espaços
opt.smartindent = true
opt.autoindent = true

-- Pesquisa
opt.ignorecase = true           -- ignora maiúsculas/minúsculas...
opt.smartcase = true            -- ...a menos que tenha letra maiúscula
opt.hlsearch = true             -- destaca resultados
opt.incsearch = true            -- pesquisa incremental

-- Arquivos
opt.swapfile = false            -- não cria arquivos .swp
opt.backup = false              -- não cria arquivos de backup
opt.undofile = true             -- habilita undo persistente

-- Desempenho
opt.updatetime = 300            -- tempo para trigger de eventos como CursorHold
opt.timeoutlen = 400            -- tempo para mapeamentos (ex: which-key)

-- Aparência
opt.wrap = false                -- não quebra linha
opt.linebreak = true            -- quebra linha em palavras
o.laststatus = 3
o.cmdheight = 0

-- Clipboard
opt.clipboard = "unnamedplus"  -- usa clipboard do sistema (requer suporte)

-- Mouse
opt.mouse = "a"                 -- ativa mouse em todos os modos

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Misc
opt.completeopt = { "menu", "menuone", "noselect" }  -- auto-completion
opt.confirm = true              -- confirma ações em vez de erro
opt.shortmess:append("cI")     -- oculta mensagens redundantes

-- Folds
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
