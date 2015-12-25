;;;###autoload
(defun np/erc-connect ()
  "Prompts for a channel, then connects to IRC."
  (interactive)
  (erc :server    "irc.freenode.net"
       :port      6667
       :nick      "NP"
       :password  erc-freenode-password
       :full-name "James Edward Gray II"))
