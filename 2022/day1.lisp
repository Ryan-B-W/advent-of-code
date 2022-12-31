(in-package :aoc-2022)

(defun day1-get-input-list (input-file)
  (with-open-file (input input-file)
    (split-sequence:split-sequence
     nil
     (loop for line = (read-line input nil nil)
           while line
           if (string= line "")
             collect nil
           else
             collect (parse-integer line)))))

(defun day1-part1 (input-file)
  (reduce #'max (map 'list (lambda (l) (reduce #'+ l)) (day1-get-input-list input-file))))

(defun day1-part2 (input-file)
  (apply #'+ (subseq (sort (map 'list (lambda (l) (reduce #'+ l)) (day1-get-input-list input-file)) #'>) 0 3)))
