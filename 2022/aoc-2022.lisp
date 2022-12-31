(defpackage :aoc-2022
  (:use #:cl #:split-sequence)
  (:import-from #:trivia
                #:match)
  (:export
   #:runner))

(in-package :aoc-2022)

(defun runner (day part)
  (match (list day part)
    ((list 1 1)
     (day1-part1 "inputs/day1"))
    ((list 1 2)
     (day1-part2 "inputs/day1"))
    ((list 2 1)
     (day2-part1 "inputs/day2"))))
