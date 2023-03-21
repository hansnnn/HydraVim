local notify = require("notify")
local path = require("plenary.path")

-- Configuração padrão
notify.setup({
	timer_interval = 10000,
	stages = "slide",
	render = "minimal",
	timeout = 2000,
	background_colour = "#FFFFFF",
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
})

local function delayed_load()
	-- Armazena o número de seguidores atual
	local followers_count = nil

	-- Função que verifica se o usuário tem notificações ou , token
	--
	-- verifica mudanças em seus seguidores no Github
	--
	local function check_notifications(token)
		-- Verifica o número de notificações
		local cmd = "curl -s -H 'Authorization: token " .. token .. "' https://api.github.com/notifications"
		local handle = io.popen(cmd)
		local result = handle:read("*a")
		handle:close()

		local json = vim.fn.json_decode(result)
		notifications_count = #json

		notify(notifications_count .. " notificações no Github", "info")
		-- Verifica o número de seguidores
		cmd = "curl -s -H 'Authorization: token " .. token .. "' https://api.github.com/user"
		handle = io.popen(cmd)
		result = handle:read("*a")
		handle:close()

		json = vim.fn.json_decode(result)
		local current_followers_count = json.followers

		-- Verifica se houve mudança no número de seguidores
		if followers_count ~= nil and current_followers_count ~= followers_count then
			local message = "Você agora tem " .. current_followers_count .. " seguidores no GitHub!"
			notify(message, "info")
		end

		-- Atualiza o número de seguidores
		followers_count = current_followers_count
	end

	-- Lê o token do arquivo, se existir
	local token_path = path:new(vim.fn.expand("$HOME") .. "/.github_token")
	local token = token_path:exists() and token_path:read() or ""

	-- Se o token não estiver vazio, executa a função check_notifications
	if token ~= "" then
		notify("Autenticado com sucesso!")
	end

	-- Pede a entrada do usuário para a token e executa a função check_notifications
	local function run_check_notifications()
		if token == "" then
			token = vim.fn.input("Insira sua token do GitHub: ")
			token_path:write(token, "w")
		end
		check_notifications(token)
	end

	-- Executa a verificação a cada 1 hora
	vim.loop.new_timer():start(0, 300000, vim.schedule_wrap(run_check_notifications))
end

vim.defer_fn(delayed_load, 5000)
