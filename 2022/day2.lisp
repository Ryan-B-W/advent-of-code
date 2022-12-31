(in-package :aoc-2022)

(defun normalize-move (move)
  (cond
    ((string= "X" move) :A)
    ((string= "Y" move) :B)
    ((string= "Z" move) :C)
    ((string= "A" move) :A)
    ((string= "B" move) :B)
    ((string= "C" move) :C)))

(defun outcome-value (opponent response)
  (cond
    ;; Tied
    ((eql opponent response) 3)
    ;; Win
    ((or
      (and (eql opponent :A) (eql response :B))
      (and (eql opponent :B) (eql response :C))
      (and (eql opponent :C) (eql response :A)))
     6)
    ;; Lose
    ((or
      (and (eql opponent :A) (eql response :C))
      (and (eql opponent :B) (eql response :A))
      (and (eql opponent :C) (eql response :B)))
     0)))

(defun choice-value (response)
  (case response
    (:A 1)
    (:B 2)
    (:C 3)))

(defun round-score (opponent response)
  (+
   (choice-value response)
   (outcome-value opponent response)))

(defun total-score (input-file)
  (with-open-file (input input-file)
    (loop
      for (opponent response) = (split-sequence #\Space (read-line input nil nil) :remove-empty-subseqs t)
      sum (round-score (normalize-move opponent) (normalize-move response))
      while (peek-char nil input nil nil))))

(defun day2-part1 (input-file)
  (total-score input-file))
