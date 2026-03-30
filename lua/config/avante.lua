-- Configuration options for the avante.nvim plugin
return {
    mode = "legacy",
    behaviour = {
      auto_suggestions = false, -- Disables the inline "ghost text" suggestions
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false, -- Prevents it from applying code changes automatically
      support_paste_from_clipboard = false,
    },
    provider = "copilot",
    providers = {
        ollama = {
            endpoint = "http://localhost:5001/api/",
            model = "gemma-3-27b-it",
        },
        gemini = {
            model = "gemini-3.0-pro",
            disable_tools = true,
        },
        openai = {
            endpoint = "http://localhost:5001/v1/",
            model = "claude-sonnet-4-20250514",
            timeout = 30000,
            extra_request_body = {
                temperature = 0.75,
                max_tokens = 20480,
            },
        },
    },
}
