-- Configuration options for the avante.nvim plugin
return {
    -- add any opts here
    -- for example
    provider = "gemini",
    providers = {
        ollama = {
            endpoint = "http://localhost:5001/api/",
            model = "gemma-3-27b-it",
        },
        gemini = {
            model = "gemini-2.5-flash",
            --model = "gemma-3-27b-it",
        },
        openai = {
            endpoint = "http://localhost:5001/v1/",
            model = "claude-sonnet-4-20250514",
            timeout = 30000, -- Timeout in milliseconds
            extra_request_body = {
                temperature = 0.75,
                max_tokens = 20480,
            },
        },
    },
}
