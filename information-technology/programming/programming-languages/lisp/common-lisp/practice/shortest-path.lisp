;; Nodes are replemented as symbols, and network
;; are represented as assoc-lists with elements of
;; of form
;; (node . neighbors)
;; For example, here is a mini network:
;; ((a b c) (b c) (c d))


;; Initially there will be only one element in the
;; queue, a path representing the start node with
;; no history. So `shortest-path` calls `bfs`
;; with (list (list start)) as the initial queue.
(defun shortest-path (start end net)
  "This function takes a start node `start`,
a destination node `end, and a nework `net`,
and returns the shortest path, if there is on."
  (bfs end (list (list start)) net))

;; To search breadth-first you have to maintain a queue
;; of unexplored nodes. Each time you get to a node,
;; you check to see if it is the one you want. If not,
;; you append each of its children to the end of the
;; queue, then take a node from the front of the queue
;; and continue the search there. By always putting
;; deeper nodes at the end of the queue, we ensure
;; that the network gets searched one layer at a time.

;; We don't just want to find the destination, but
;; to keep a record of how we got there. So instead
;; of maintaining a queue of nodes, we maintain a
;; queue of paths we've followed, each of which is
;; a list of nodes. When we take an element from
;; the queue to continue the search, it will not
;; be a node but a list, with the node on the front.
(defun bfs (end queue net)
  (if (null queue)
      nil
      (let ((path (car queue)))
	(let ((node (car path)))
	  (if (eql node end)
	      ;; If found, reverse it for readability.
	      (reverse path)
	      (bfs end
		   (append (cdr queue)
			   (new-paths path node net))
		   net))))))

(defun new-paths (path node net)
  (mapcar #'(lambda (n)
	      (cons n path))
	  (cdr (assoc node net))))
