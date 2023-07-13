;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : init-elvish.scm
;; DESCRIPTION : Initialize elvish plugin
;; COPYRIGHT   : (C) 2023	Darcy Shen
;;
;; This software falls under the GNU general public license version 3 or later.
;; It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
;; in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (elvish-serialize lan t)
  (with u (pre-serialize lan t)
    (with s (texmacs->code (stree->tree u) "SourceCode")
      (string-append  s "\n<EOF>\n"))))

(define (elvish-entry)
  (if (url-exists? "$TEXMACS_HOME_PATH/plugins/elvish")
      (system-url->string "$TEXMACS_HOME_PATH/plugins/elvish/src/main.elv")
      (system-url->string "$TEXMACS_PATH/plugins/elvish/src/main.elv")))

(define (elvish-launcher)
  (string-append "elvish " (elvish-entry)))

(plugin-configure elvish
  (:require (url-exists-in-path? "elvish"))
  (:launch ,(elvish-launcher))
  (:serializer ,elvish-serialize)
  (:session "Elvish"))
