.libPaths(c("~/.local/lib/Rpckg"))
# install colorout by remotes::install_github("jalvesaq/colorout")
options(repos = structure(c(CRAN = "https://ftp.gwdg.de/pub/misc/cran/")))
suppressMessages(require(remotes))
suppressMessages(require(colorout))
suppressMessages(require(languageserver))
options(editor = "nvim")

if (interactive()) {
    if (Sys.getenv("NVIMR_TMPDIR") != "") {
        options(nvimcom.verbose = 1)
        library(nvimcom)
    }
}

colorout::setOutputColors(
    index = "\x1b[38;2;76;86;106m",
    normal = "\x1b[38;2;216;222;233m",
    number = "\x1b[38;2;236;239;244m",
    negnum = "\x1b[38;2;180;142;173m",
    zero = "\x1b[38;2;136;192;208m", zero.limit = 0.01,
    infinite = "\x1b[38;2;236;239;244m",
    string = "\x1b[38;2;235;203;139m",
    date = "\x1b[38;2;236;239;244m",
    const = "\x1b[38;2;136;192;208m",
    true = "\x1b[38;2;163;190;140m",
    false = "\x1b[38;2;191;97;106m",
    warn = "\x1b[38;2;235;203;139m",
    stderror = "\x1b[38;2;191;97;106m", error = "\x1b[38;2;191;97;106m",
    verbose = FALSE
)
# _ {data.table} ---------------------------------
colorout::addPattern("[0-9]*:", "\x1b[38;2;143;188;187m") # Row num
colorout::addPattern("---", "\x1b[38;2;76;86;106m") # Row splitter
colorout::addPattern("<[a-z]*>", "\x1b[38;2;143;188;187m") # Col class

# _ `str` ----------------------------------------
# Class
colorout::addPattern(" num ", "\x1b[38;2;143;188;187m")
colorout::addPattern(" int ", "\x1b[38;2;143;188;187m")
colorout::addPattern(" chr ", "\x1b[38;2;143;188;187m")
colorout::addPattern(" Factor ", "\x1b[38;2;143;188;187m")
colorout::addPattern(" Ord.factor ", "\x1b[38;2;143;188;187m")
colorout::addPattern(" logi ", "\x1b[38;2;143;188;187m")
colorout::addPattern("function ", "\x1b[38;2;143;188;187m")
colorout::addPattern(" dbl ", "\x1b[38;2;143;188;187m")
colorout::addPattern(" lgcl ", "\x1b[38;2;143;188;187m")
colorout::addPattern(" cplx ", "\x1b[38;2;143;188;187m")
# Misc
colorout::addPattern("$ ", "\x1b[38;2;76;86;106m")

# _ `str`, {mlr3} --------------------------------
# R6 field name
colorout::addPattern("* [A-z]*:", "\x1b[38;2;235;203;139m")
colorout::addPattern("* [A-z]* [A-z]*:", "\x1b[38;2;235;203;139m")
colorout::addPattern("* [A-z]* [A-z]* [A-z]*:", "\x1b[38;2;235;203;139m")
colorout::addPattern("* [A-z]* [A-z]* [A-z]* [A-z]*:", "\x1b[38;2;235;203;139m")
