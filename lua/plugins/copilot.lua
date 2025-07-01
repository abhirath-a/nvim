return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },

  -- {
  -- 	"CopilotC-Nvim/CopilotChat.nvim",
  -- 	cmd = {
  -- 		"CopilotChat",
  -- 		"CopilotChatOpen",
  -- 		"CopilotChatClose",
  -- 		"CopilotChatToggle",
  -- 		"CopilotChatStop",
  -- 		"CopilotChatReset",
  -- 		"CopilotChatSave",
  -- 		"CopilotChatLoad",
  -- 		"CopilotChatPrompts",
  -- 		"CopilotChatModels",
  -- 		"CopilotChatAgents",
  -- 	},
  -- 	dependencies = {
  -- 		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  -- 		{ "zbirenbaum/copilot.lua" }, -- Required for Copilot integration
  -- 	},
  -- 	build = "make tiktoken", -- Only on MacOS or Linux
  -- 	opts = {
  -- 		-- See Configuration section for options
  -- 	},
  -- 	-- See Commands section for default commands if you want to lazy load on them
  -- },
}
