return {
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    hover = true,
    documentSymbol = true,
    completion = true,
  },
  settings = {
    rootMarkers = {'.git/', '.textlintrc.json'},
    languages = {
      markdown = {
        {
          lintCommand = "npx -g textlint --format unix --stdin --stdin-filename ${INPUT}",
          lintFormats = "%f:%l:%n: %m",
          formatStdin = true,
        }
      },
    },
  },
  filetypes = { 'markdown' },
}
