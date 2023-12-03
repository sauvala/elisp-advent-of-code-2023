(defun file-to-string (file)
  "File to string function"
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(setq example_input "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen")

(setq input example_input)
;;(setq input (file-to-string "input.txt"))

(setq rows (split-string input))

(defun normalize-numbers (s)
  ))

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

(setq foobar "onetwoone")
(setq foobar (replace-regexp-in-string "one" "1" foobar))
