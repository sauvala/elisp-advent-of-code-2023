(defun file-to-string (file)
  "File to string function"
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(setq example_input "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet")

;;(setq input example_input)
(setq input (file-to-string "input.txt"))

(setq rows (split-string input))

(defun take-numbers (s)
  (let ((n (read s)))
    (when (numberp n) n)))

(defun not-nullp (n)
  (not (null n)))

(defun to-chars (s)
  (let* ((strings (mapcar #'char-to-string s))
         (nums (mapcar #'take-numbers strings)))
    (seq-filter #'not-nullp nums)))

(setq rows-numbers (mapcar #'to-chars rows))

(defun calc-calib-value (r)
  (let ((first (car r))
        (last (car (last r))))
    (read (format "%d%d" first last))))

(setq calib-values (mapcar #'calc-calib-value rows-numbers))

(setq answer (seq-reduce #'+ calib-values 0))
