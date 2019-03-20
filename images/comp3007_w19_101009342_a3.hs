-----------------------------------------------------------------------
-- COMP 3007 Assignment 3 --
-- Michael Rabbai
-- 101009342
-----------------------------------------------------------------------

-- Test: (Union (Union (Single 1) (Single 3) [(1,3)]) (Union (Single 2) (Single 4) [(4,2)]) [(1,4), (2,1), (3,2)])

-- Data Types --
-----------------------------------------------------------------------
type Node = Int
type Edge = (Node, Node)
data Graph = Single Node | Union Graph Graph [Edge] deriving Show


-- Functions --
-----------------------------------------------------------------------
-- Question 1
-- Test: containsNode 1 (Union (Union (Single 1) (Single 3) [(1,3)]) (Union (Single 2) (Single 4) [(4,2)]) [(1,4), (2,1), (3,2)])
containsNode :: Node -> Graph -> Bool
containsNode nodeToFind (Union graph1 graph2 ((x,y):t))
  | (nodeToFind == x) || (nodeToFind == y) = True
  | otherwise = containsNode nodeToFind (Union graph1 graph2 t)
containsNode nodeToFind (Single node)
  | nodeToFind == node = True
containsNode node _ = False -- end of graph 


-- Question 2
-- Test: containsEdge (1,3) (Union (Union (Single 1) (Single 3) [(1,3)]) (Union (Single 2) (Single 4) [(4,2)]) [(1,4), (2,1), (3,2)])
containsEdge :: Edge -> Graph -> Bool
containsEdge _ (Single node) = False -- end of graph
containsEdge edgeToFind (Union graph1 graph2 []) = (containsEdge edgeToFind graph1) || (containsEdge edgeToFind graph2)
containsEdge edgeToFind (Union graph1 graph2 (h:t))
  | edgeToFind == h = True
  -- | t == [] = (containsEdge edgeToFind graph1) || (containsEdge edgeToFind graph2)
  | otherwise = containsEdge edgeToFind (Union graph1 graph2 t)


-- Question 3
-- Test: listNodes (Union (Union (Single 1) (Single 3) [(1,3)]) (Union (Single 2) (Single 4) [(4,2)]) [(1,4), (2,1), (3,2)])
listNodes :: Graph -> [Node]
listNodes (Single node) = (node:[])
listNodes (Union graph1 graph2 edges) = (listNodes graph1) ++ (listNodes graph2)


-- Question 4
-- Test: listEdges (Union (Union (Single 1) (Single 3) [(1,3)]) (Union (Single 2) (Single 4) [(4,2)]) [(1,4), (2,1), (3,2)])
listEdges :: Graph -> [Edge]
listEdges (Single node) = []
listEdges (Union graph1 graph2 []) = (listEdges graph1) ++ (listEdges graph2)
listEdges (Union graph1 graph2 (h:t)) = h : (listEdges (Union graph1 graph2 t))


-- Question 5
-- Test: isSingleton (Union (Union (Single 1) (Single 3) [(1,3)]) (Union (Single 2) (Single 4) [(4,2)]) [(1,4), (2,1), (3,2)])
-- Test: isSingleton (Single 1)
isSingleton :: Graph -> Bool
isSingleton (Single _) = True
isSingleton _ = False


-- Question 6
-- Test: bfsTraversal (Union (Union (Single 1) (Single 3) [(1,3)]) (Union (Single 2) (Single 4) [(4,2)]) [(1,4), (2,1), (3,2)]) 1
bfsTraversal :: Graph -> Node -> [Node]
bfsTraversal graph startNode = bfsTraversal' adjNodes allEdges [startNode] [startNode]
  where allEdges = (listEdges graph)
        adjNodes = quickSort (getAdjNodes startNode allEdges)

bfsTraversal' :: [Node] -> [Edge] -> [Node] -> [Node] -> [Node]
bfsTraversal' _ _ [] result = [] -- or return result?
bfsTraversal' adjNodes allEdges (qH:next:qT) result = (addNodes adjNodes result) ++ recursiveCall
  where nextAdjNodes = (quickSort (getAdjNodes next allEdges))
        recursiveCall = bfsTraversal' nextAdjNodes allEdges (addNodes adjNodes (next:qT)) result

-- Test: getAdjNodes (listEdges (Union (Union (Single 1) (Single 3) [(1,3)]) (Union (Single 2) (Single 4) [(4,2)]) [(1,4), (2,1), (3,2)]))
getAdjNodes :: Node -> [Edge] -> [Node]
getAdjNodes _ [] = []
getAdjNodes targetNode ((value,adjNode):t)
  | targetNode == value = adjNode : (getAdjNodes targetNode t)
  | otherwise = (getAdjNodes targetNode t)

-- Test: isNodeInList 1 (listNodes (Union (Union (Single 1) (Single 3) [(1,3)]) (Union (Single 2) (Single 4) [(4,2)]) [(1,4), (2,1), (3,2)]))
isNodeInList :: Node -> [Node] -> Bool
isNodeInList _ [] = False
isNodeInList targetNode (h:t)
  | targetNode == h = True
  | otherwise = (isNodeInList targetNode t)

-- Test: addNodes [1,2,3,4,5,6,7,8,9] [1,3,5,7,9]
addNodes :: [Node] -> [Node] -> [Node]
addNodes [] queue = queue
addNodes (nodeToAdd:t) queue
  | (isNodeInList nodeToAdd queue) = (addNodes t queue)
  | otherwise = (addNodes t (queue ++ [nodeToAdd]))

-- Test: quickSort [1,9,8,3,2,7,4]
quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort (h:t) = (quickSort [x | x <- t, x <= h]) ++ [h] ++ (quickSort [x | x <- t, x > h])

-- Test: getAdjNodes [(1,3), (1,4)]
-- getAdjNodes :: [(Node, Node)] -> [Node]
-- getAdjNodes [] = []
-- getAdjNodes ((from,to):t) = (to : (getAdjNodes t))



        
-- bfsTraversal' :: Graph -> Node -> [Node] -> [Edge] -> [Node] -> [Node]
-- bfsTraversal' _ _ _ [] _ = []
-- bfsTraversal' graph startNode adjNodes edges (start:next:remainingNodes) = (addNodes adjNodes (start:next:remainingNodes)) ++ recursiveCall
--   where nextAdjNodes = (quickSort (getAdjNodes (getEdges next (listEdges graph))))
--         recursiveCall = (bfsTraversal' graph next nextAdjNodes edgesLeft (start:next:remainingNodes))
--         edgesLeft = (removeEdges startNode edges)

-- bfsTraversal' _ _ [] _ = []
-- bfsTraversal' graph start ((from:to):t) nodes 
--   | (isDiscovered nodeToAdd) = bfsTraversal' graph ?? remainingEdges nodes
--   | otherwise = nodeToAdd : bfsTraversal' graph ?? remainingEdges (nodes ++ [nodeToAdd])
--   where nodeToAdd = (getFirstElement (quickSort (getChildren (getEdges start ((from:to):t)))))
--   where remainingEdges = (removeEdges (getEdges start ((from:to):t)))
-- = start : (bfsTraversal' graph (getFirstElement (quickSort (getChildren (getEdges start ((from:to):t)))))) (removeEdges (getEdges start ((from:to):t)))



-- bfsTraversal' :: Graph -> Node -> [Node] -> [Node]
-- bfsTraversal' graph start nodes

-- bfsTraversal :: Graph -> Node -> [Node]
-- bfsTraversal graph start = bfsTraversal' graph start (listOrder start listNodes)

-- listOrder :: Node -> [Node] -> [Node] -- create a list from a starting point in a "circular" list

-- isNodeInList :: Node -> [Node]


-- Question 7
-- graphFromAdjList :: [(Node, [Node])] -> Graph
-- graphFromAdjList [] = error "Empty List"
-- graphFromAdjList [(_,[])] = ??
-- graphFromAdjList [(node, (h:t))] = ??


-- createEdge


-- Question 8
