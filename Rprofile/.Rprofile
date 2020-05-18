library(colorout)
#library(styler)
#library(lintr)
#library(languageserver)
options(editor = "nvim")
setOutputColors(normal   = "\x1b[38;2;248;248;242m",
                negnum   = "\x1b[38;2;80;250;123m",
                zero     = "\x1b[38;2;80;250;123m",
                number   = "\x1b[38;2;80;250;123m",
                date     = "\x1b[38;2;241;250;140m",
                string   = "\x1b[38;2;241;250;140m",
                const    = "\x1b[38;2;189;147;249m",
                false    = "\x1b[38;2;255;121;198m",
                true     = "\x1b[38;2;255;121;198m",
                infinite = "\x1b[38;2;255;85;85m",
                index    = "\x1b[38;2;139;233;253m",
                stderror = "\x1b[38;2;255;184;108m",
                warn     = "\x1b[38;2;255;184;108m",
                error    = "\x1b[48;2;255;85;85;38;2;248;248;242m",
                zero.limit = 0.01,
                verbose = FALSE)

 if(interactive()){
             if(Sys.getenv("NVIMR_TMPDIR") != ""){
                 options(nvimcom.verbose = 1)
                 library(nvimcom)
             }
         }
