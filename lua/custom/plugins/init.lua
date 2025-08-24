-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Check if apiKey is set then enable otherwise print message and disable
local apiKey = os.getenv 'LTEX_API_KEY'
if not apiKey or apiKey == '' then
  print 'LTEX_API_KEY is not set. Disabling ltex-ls plugin.'
  return {}
end
return {
  'valentjn/ltex-ls',
  settings = {
    ltex = {
      enabled = {
        'bibtex',
        'context',
        'context.tex',
        'latex',
        'markdown',
        'org',
        'restructuredtext',
        'rsweave',
      },
      language = 'en',
      languageToolHttpServerUri = 'https://api.languagetoolplus.com',
      latex = {
        -- json object with list of the commands
        commands = '{"\\label{}": "ignore", "\\documentclass[]{}": "ignore", "\\cite{}": "dummy", "\\cite[]{}": "dummy"}',
      },
      languageToolOrg = {
        username = os.getenv 'LTEX_USERNAME',
        apiKey = apiKey,
      },
      diagnosticSeverity = 'information',
      sentenceCacheSize = 2000,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = 'en',
      },
    },
  },
}
