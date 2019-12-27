//
//  Traversal.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

// Perform a Depth First Search (DFS) on the given graph
func dfs<K: Hashable, W: Comparable>(graph: Graph<K, W>) -> [K] {
    var visited = Set<K>()
    var res: [K] = []

    for elem in graph.getVertices() {
        // already visited this vertex
        if visited.contains(elem) {
            continue
        }

        // explore the graph starting from 'elem'
        explore(vertex: elem, graph: graph, visited: &visited, res: &res)
    }

    return res
}

// Perform a Breadth First Search (BFS) on the given graph
func bfs<K: Hashable, W: Comparable>(graph: Graph<K, W>) -> [K] {
    var visited = Set<K>()
    var res: [K] = []

    for elem in graph.getVertices() {
        // already visited this vertex
        if visited.contains(elem) {
            continue
        }

        var queue = LinkedList<K>()
        queue.add(elem: elem)

        while !queue.isEmpty() {
            let curr = queue.remove()!

            if visited.contains(curr) {
                continue
            }

            visited.insert(curr)
            res.append(curr)

            queue.addAll(items: graph.outgoing(from: curr))
        }
    }

    return res
}

func cycle<K: Hashable, W: Comparable>(graph: Graph<K, W>, undirected: Bool) -> [[K]] {
    var visited = Set<K>()
    var trace: [K] = []
    var all: [[K]] = []

    for elem in graph.getVertices() {
        // already seen this element in a previous DFS run
        // this is not a cycle though -- so simply ignore it and continue on
        if visited.contains(elem) {
            continue
        }

        cycleExplore(parent: nil, vertex: elem,
            graph: graph, visited: &visited, trace: &trace, all: &all, pos: 0, undirected: undirected)
    }

    return all
}

func reverse<K: Hashable, W: Comparable>(graph: Graph<K, W>) -> Graph<K, W> {
    var res = Graph<K, W>()

    // all the vertices are the same in G^R
    for vtx in graph.getVertices() {
        res.addVertex(vtx)
    }

    // add the edges -- but switch 'from' and 'to' in G^R
    for from in graph.getVertices() {
        let toList = graph.outgoing(from: from)

        for to in toList {
            let weight = graph.weight(from: from, to: to)
            let _ = res.addEdge(from: to, to: from, weight: weight)
        }
    }

    return res
}

func toposort<K: Hashable, W: Comparable>(graph: Graph<K, W>) -> [K] {
    var visited = Set<K>()
    var stack = Stack<K>()
    var res: [K] = []

    for elem in graph.getVertices() {
        if visited.contains(elem) {
            continue
        }

        topoExplore(vertex: elem, graph: graph, visited:
            &visited, res: &stack)
    }

    while !stack.isEmpty() {
        res.append(stack.pop()!)
    }

    return res
}

// Helper function to explore from a given vertex
private func explore<K: Hashable, W: Comparable>(vertex: K, graph: Graph<K, W>,
          visited: inout Set<K>, res: inout [K])
{
    if visited.contains(vertex) {
        return
    }

    visited.insert(vertex)
    res.append(vertex)

    // continue exploring
    for elem in graph.outgoing(from: vertex) {
        explore(vertex: elem, graph: graph, visited: &visited, res: &res)
    }
}

private func cycleExplore<K: Hashable, W: Comparable>(parent: K?, vertex: K, graph: Graph<K, W>,
            visited: inout Set<K>, trace: inout [K], all: inout [[K]], pos: Int, undirected: Bool)
{
    // found a cycle
    if visited.contains(vertex) {
        var res: [K] = [vertex]

        for i in (0..<trace.count).reversed() {
            let curr = trace[i]

            if curr == vertex {
                break
            }

            res.append(curr)
        }

        all.append(res)
        return
    }

    visited.insert(vertex)
    trace.append(vertex)

    // continue exploring
    for elem in graph.outgoing(from: vertex) {
        if elem == parent && undirected {
            continue
        }

        cycleExplore(parent: vertex, vertex: elem, graph: graph,
              visited: &visited, trace: &trace, all: &all, pos: trace.count, undirected: undirected)

        // cleanup the trace
        for _ in (pos + 1..<trace.count).reversed() {
            trace.removeLast()
        }
    }
}

private func topoExplore<K: Hashable, W: Comparable>(vertex: K, graph: Graph<K, W>,
       visited: inout Set<K>, res: inout Stack<K>)
{
    if visited.contains(vertex) {
        return
    }

    visited.insert(vertex)

    for elem in graph.outgoing(from: vertex) {
        topoExplore(vertex: elem, graph: graph, visited: &visited, res: &res)
    }

    res.push(elem: vertex)
}
