(defun file-to-string (file)
  "File to string function"
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(setq example_input "eighthree
sevenine
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen")

;;(setq input "sevenine")
;;(setq input example_input)
(setq input (file-to-string "input.txt"))

(setq rows (split-string input))

(defun normalize-numbers (s)
  (let ((processed "")
        (i 0))
    (while (< i (length s))
      (let* ((process (concat processed (substring s i (+ i 1))))
            (prev-process process))
        (dolist (num '(("one" . "1") ("two" . "2") ("three" . "3")
                       ("four" . "4") ("five" . "5") ("six" . "6")
                       ("seven" . "7") ("eight" . "8") ("nine" . "9")))
          (setq process (replace-regexp-in-string (car num) (cdr num) process)))
        (when (= (length process) (length prev-process))
          (setq i (+ i 1)))
        (setq processed process)))
    processed))

(setq normalized-rows (mapcar #'normalize-numbers rows))

(defun take-numbers (s)
  (let ((n (read s)))
    (when (numberp n) n)))

(defun not-nullp (n)
  (not (null n)))

(defun to-chars (s)
  (let* ((strings (mapcar #'char-to-string s))
         (nums (mapcar #'take-numbers strings)))
    (seq-filter #'not-nullp nums)))

(setq rows-numbers (mapcar #'to-chars normalized-rows))

(defun calc-calib-value (r)
  (let ((first (car r))
        (last (car (last r))))
    (read (format "%d%d" first last))))

(setq calib-values (mapcar #'calc-calib-value rows-numbers))

(dolist (e calib-values)
  (print e))

(setq answer (seq-reduce #'+ calib-values 0))
