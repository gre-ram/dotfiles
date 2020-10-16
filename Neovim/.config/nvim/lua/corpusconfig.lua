vim.api.nvim_command('packadd! corpus')
CorpusDirectories = {
      ['~/Documents/myBib/notes'] = {
        autocommit = true,
        autoreference = 1,
        autotitle = 1,
        tags = {'MA'},
        transform = 'local',
      },
      ['~/Documents/myBib/wiki'] = {
        autocommit = true,
        autoreference = 1,
        autotitle = 1,
        tags = {'wiki'},
        transform = 'local',
      },
  }
