(load "quicklisp.lisp")
(quicklisp-quickstart:install)
(ql::without-prompting (ql:add-to-init-file))
(ql:quickload :swank)
