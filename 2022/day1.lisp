(in-package :aoc-2022)

(defun day1-part1 (input-file)
  (with-open-file (input input-file)
    (let ((input-list
            (split-sequence:split-sequence
             nil
             (loop for line = (read-line input nil nil)
                   while line
                   if (string= line "")
                     collect nil
                   else
                     collect (parse-integer line)))))
      (reduce #'max (map 'list (lambda (l) (reduce #'+ l)) input-list)))))

(defun day1-part2 (input-file)
  (with-open-file (input input-file)
    (let ((input-list
           (split-sequence:split-sequence
            nil
            (loop for line = (read-line input nil nil)
               while line
               if (string= line "")
               collect nil
               else
               collect (parse-integer line)))))
      (apply #'+ (subseq (sort (map 'list (lambda (l) (reduce #'+ l)) input-list) #'>) 0 3)))))
