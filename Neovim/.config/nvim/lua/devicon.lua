local M = {}

local extensionTable = {
      -- Exact Match
      ['gruntfile.coffee']                 = '',
      ['gruntfile.js']                     = '',
      ['gruntfile.ls']                     = '',
      ['gulpfile.coffee']                  = '',
      ['gulpfile.js']                      = '',
      ['gulpfile.ls']                      = '',
      ['mix.lock']                         = '',
      ['dropbox']                          = '',
      ['.ds_store']                        = '',
      ['.gitconfig']                       = '',
      ['.gitignore']                       = '',
      ['.gitlab-ci.yml']                   = '',
      ['.bashrc']                          = '',
      ['.zshrc']                           = '',
      ['.vimrc']                           = '',
      ['.gvimrc']                          = '',
      ['_vimrc']                           = '',
      ['_gvimrc']                          = '',
      ['.bashprofile']                     = '',
      ['favicon.ico']                      = '',
      ['license']                          = '',
      ['node_modules']                     = '',
      ['react.jsx']                        = '',
      ['procfile']                         = '',
      ['dockerfile']                       = '',
      ['docker-compose.yml']               = '',
      -- Extension
      ['styl']     = '',
      ['sass']     = '',
      ['scss']     = '',
      ['htm']      = '',
      ['html']     = '',
      ['slim']     = '',
      ['ejs']      = '',
      ['css']      = '',
      ['less']     = '',
      ['md']       = '',
      ['mdx']      = '',
      ['markdown'] = '',
      ['rmd']      = '',
      ['json']     = '',
      ['js']       = '',
      ['mjs']      = '',
      ['jsx']      = '',
      ['rb']       = '',
      ['php']      = '',
      ['py']       = '',
      ['pyc']      = '',
      ['pyo']      = '',
      ['pyd']      = '',
      ['coffee']   = '',
      ['mustache'] = '',
      ['hbs']      = '',
      ['conf']     = '',
      ['ini']      = '',
      ['yml']      = '',
      ['yaml']     = '',
      ['toml']     = '',
      ['bat']      = '',
      ['jpg']      = '',
      ['jpeg']     = '',
      ['bmp']      = '',
      ['png']      = '',
      ['gif']      = '',
      ['ico']      = '',
      ['twig']     = '',
      ['cpp']      = '',
      ['c++']      = '',
      ['cxx']      = '',
      ['cc']       = '',
      ['cp']       = '',
      ['c']        = '',
      ['cs']       = '',
      ['h']        = '',
      ['hh']       = '',
      ['hpp']      = '',
      ['hxx']      = '',
      ['hs']       = '',
      ['lhs']      = '',
      ['lua']      = '',
      ['java']     = '',
      ['sh']       = '',
      ['fish']     = '',
      ['bash']     = '',
      ['zsh']      = '',
      ['ksh']      = '',
      ['csh']      = '',
      ['awk']      = '',
      ['ps1']      = '',
      ['ml']       = 'λ',
      ['mli']      = 'λ',
      ['diff']     = '',
      ['db']       = '',
      ['sql']      = '',
      ['dump']     = '',
      ['clj']      = '',
      ['cljc']     = '',
      ['cljs']     = '',
      ['edn']      = '',
      ['scala']    = '',
      ['go']       = '',
      ['dart']     = '',
      ['xul']      = '',
      ['sln']      = '',
      ['suo']      = '',
      ['pl']       = '',
      ['pm']       = '',
      ['t']        = '',
      ['rss']      = '',
      ['f#']       = '',
      ['fsscript'] = '',
      ['fsx']      = '',
      ['fs']       = '',
      ['fsi']      = '',
      ['rs']       = '',
      ['rlib']     = '',
      ['d']        = '',
      ['erl']      = '',
      ['hrl']      = '',
      ['ex']       = '',
      ['exs']      = '',
      ['eex']      = '',
      ['leex']     = '',
      ['vim']      = '',
      ['ai']       = '',
      ['psd']      = '',
      ['psb']      = '',
      ['ts']       = '',
      ['tsx']      = '',
      ['jl']       = '',
      ['pp']       = '',
      ['vue']      = '﵂',
      ['elm']      = '',
      ['swift']    = '',
      ['xcplayground'] = ''}


M.deviconTable = setmetatable(extensionTable,{
  __index = function(extensionTable, key)
    local i = string.find(key, '[.*]')
    if i ~= nil then
      return extensionTable[string.sub(key, i+1)]
    end
  end
})

return M
