require("minuet").setup({
	provider = "openai_fim_compatible",
	n_completions = 1, -- recommend for local model for resource saving
	-- I recommend beginning with a small context window size and incrementally
	-- expanding it, depending on your local computing power. A context window
	-- of 512, serves as an good starting point to estimate your computing
	-- power. Once you have a reliable estimate of your local computing power,
	-- you should adjust the context window to a larger value.
	context_window = 4096, -- More context = better function understanding
	request_timeout = 10, -- Max time to wait while generating (update in blink as well)
	provider_options = {
		openai_fim_compatible = {
			-- For Windows users, TERM may not be present in environment variables.
			-- Consider using APPDATA instead.
			api_key = "TERM",
			name = "Ollama",
			end_point = "http://localhost:11434/v1/completions",
			model = "qwen2.5-coder:14b-base",
			optional = {
				max_tokens = 512, -- Started at 56, needs to be high enough for full function
				top_p = 0.9,
				temperature = 0.2, -- Lower = More deterministic/accurate code
				-- stop = { "\nlocal function", "\nfunction", "\nprint" }, -- stop at next function/statement
			},
		},
	},
})
