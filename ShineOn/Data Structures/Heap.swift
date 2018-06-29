import Foundation

final class Heap<Element: Comparable> {
    
    enum Attribute {
        case maxHeap, minHeap
    }
    
    let type: Attribute
    
    /// Keep track data
    private(set) var contents: [Element]
    
    private var count: Int {
        return contents.count
    }
    
    private var lastNodeIndex: Int? {
        guard !contents.isEmpty else { return nil }
        return count - 1
    }
    
    // Initilizer
    
    init(contents: [Element], type: Attribute) {
        self.contents = contents
        self.type = type
    }
    
    // MARK: - Public methods
    
    func add(element: Element) {
        contents.append(element)
        guard let lastNodeIndex = lastNodeIndex else {
            preconditionFailure("It should never come to this case")
            return
        }
        shiftUp(nodeIndex: lastNodeIndex)
    }
    
    func peek() -> Element? {
        return contents.first
    }
    
    func remove(element: Element) {
        preconditionFailure("Not implemented yet")
    }
    
    /// Pop the root of heap
    func remove() -> Element? {
        
        guard let lastNodeIndex = lastNodeIndex else {
            return nil
        }
        let rootIndex = 0
        swap(lhsIndex: rootIndex, rhsIndex: lastNodeIndex)
        
        let exRootContent = contents[lastNodeIndex]
        // Cut the exRoot to return a smaller heap
        contents.remove(at: lastNodeIndex)
        
        // Rebalance heap
        shiftDown(nodeIndex: rootIndex)
        
        return exRootContent
    }
    
    func isEmpty() -> Bool {
        return contents.isEmpty
    }
    
    // MARK: - Private methods
    
    // Shift the node until it match the rule of Heap
    private func shiftUp(nodeIndex: Int) {
        switch type {
        case .maxHeap:
            guard let parentIndex = parentIndex(nodeIndex: nodeIndex) else {
                // No parent
                return
            }
            let parent = contents[parentIndex]
            let candidateNode = contents[nodeIndex]
            guard parent < candidateNode else { return }
            swap(lhsIndex: parentIndex, rhsIndex: nodeIndex)
            let newNodeIndex = parentIndex
            shiftUp(nodeIndex: newNodeIndex)
        case .minHeap:
            preconditionFailure("Not support yet")
        }
    }
    
    
    private func shiftDown(nodeIndex: Int) {
        switch type {
        case .maxHeap:
            
            let rootIndex = nodeIndex
            let leftIndex = leftNodeIndex(rootIndex: rootIndex)
            let rightIndex = rightNodeIndex(rootIndex: rootIndex)
            
            guard leftIndex != nil || rightIndex != nil else { return }
            
            // find the maximum in 3 candidate
            let candidateIndex = indexOfMaxContentIn(rootIndex: rootIndex, leftNodeIndex: leftIndex, rightNodeIndex: rightIndex)
            
            guard candidateIndex != rootIndex else { return }
            
            swap(lhsIndex: rootIndex, rhsIndex: candidateIndex)
            shiftDown(nodeIndex: candidateIndex)
        case .minHeap:
            preconditionFailure("Not support yet")
        }
    }
    
    private func parentIndex(nodeIndex: Int) -> Int? {
        // NOTE: Float, Double, Int converting
        let candidateParentIndex = floor((Float(nodeIndex) - 1)/2)
        guard candidateParentIndex >= 0 else { return nil }
        return Int(candidateParentIndex)
    }
    
    private func swap(lhsIndex: Int, rhsIndex: Int) {
        let tempLhs = contents[lhsIndex]
        contents[lhsIndex] = contents[rhsIndex]
        contents[rhsIndex] = tempLhs
    }
    
    /// return the index which contents is the biggest value in 3 parameters
    private func indexOfMaxContentIn(rootIndex: Int, leftNodeIndex: Int?, rightNodeIndex: Int?) -> Int {
        switch (rootIndex, leftNodeIndex, rightNodeIndex) {
        case (let root, let left?, let right?):
            let biggestIndexOfRootAndLeft = indexOfTheBiggestContent(between: root, and: left)
            return indexOfTheBiggestContent(between: biggestIndexOfRootAndLeft, and: right)
        case (let root, nil, let right?):
            return indexOfTheBiggestContent(between: root, and: right)
        case (let root, let left?, nil):
            return indexOfTheBiggestContent(between: root, and: left)
        case (let root, nil, nil):
            return root
        }
    }
    
    private func indexOfTheBiggestContent(between aIndex: Int, and bIndex: Int) -> Int {
        let contentA = contents[aIndex]
        let contentB = contents[bIndex]
        if contentA >= contentB {
            return aIndex
        } else {
            return bIndex
        }
    }
    
    private func leftNodeIndex(rootIndex: Int) -> Int? {
        let candidateLeftNodeIndex = 2*rootIndex + 1
        guard candidateLeftNodeIndex < count else { return nil }
        return candidateLeftNodeIndex
    }
    
    private func rightNodeIndex(rootIndex: Int) -> Int? {
        let candidateRightNodeIndex = 2*rootIndex + 2
        guard candidateRightNodeIndex < count else { return nil }
        return candidateRightNodeIndex
    }
    
}




