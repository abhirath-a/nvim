require("obsidian").setup({
  completion = {
    blink = true, 
  },
  workspaces = {
    {
      name = "vault",
      path = "~/vault"
    }
  },
  templates = {
    folder = "5.templates"
  }
})
