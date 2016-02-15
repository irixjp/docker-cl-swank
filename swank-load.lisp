(setf SB-IMPL::*DEFAULT-EXTERNAL-FORMAT* :utf-8)

(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(require :swank)

(defvar *server* nil)

(defun main ()
  (setf swank::*LOOPBACK-INTERFACE* "0.0.0.0")
  (setf *server* (swank:create-server :port 4005 :style :spawn :dont-close t))
  (loop (sleep 60)))

(defun my-stop ()
  (swank:stop-server *server*))

(main)
