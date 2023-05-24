(defcustom dotfiles-folder "~/Desktop/CEADS-LIN/"
  "The folder where dotfiles and org-mode configuration files are stored"
  :type 'string
  :group 'dotfiles)

(defcustom dotfiles-org-files "README.org"
  "The list of org-mode files under the 'dotfiles-folder' "
  :type '(list string)
  :group 'dotfiles)

(defun dotfiles-tangle-org-file (&optional org-file)
  "Tangles a signle .org file relative to the path in dotfiles-folder.  If no file is specified, tangle the current file if it is an org-mode buffer inside of dotfiles folder."
  (interactive "F")
  (message "File: %s" org-file)
  ;;Suppresses Prompts
  (let ((org-confirm-babel-eval nil)
        (message-log-max nil)
        (inhibit-message t)))
    (org-babel-tangle-file (expand-file-name org-file dotfiles-folder)))

(defun dotfiles-tangle-org-files ()
  "Tangles all of the .org files in the paths specified by the variable dotfiles-folder"
  (interactive)
  (dolist (org-file dotfiles-org-files)
    (dotfiles-tangle-org-file org-file))
  (message "Dotfiles are up to date!"))
