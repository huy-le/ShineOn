import XCTest
@testable import ShineOn


final class HeapTests: XCTestCase {
    
    func testAdd() {
        // Prepare
        let heap = Heap(contents: Array<Int>(), type: .maxHeap)
        // Do
        heap.add(element: 5)
        // Expect
        expect(heap.contents == [5])
        
        
        // We will do a bunch of adding
        heap.add(element: 2)
        expect(heap.contents == [5,2])
        
        heap.add(element: 1)
        expect(heap.contents == [5,2,1])
        
        heap.add(element: 6)
        expect(heap.contents == [6,5,1,2])
        
        heap.add(element: 4)
        expect(heap.contents == [6,5,1,2,4])
        
        heap.add(element: 3)
        expect(heap.contents == [6,5,3,2,4,1])
    }
    
    func testRemove() {
        
        func test(input: [Int], expectedRoot: Int?, expectedContents: [Int]) {
            // Prepare
            let heap = Heap(contents: input, type: .maxHeap)
            // Do
            let root = heap.remove()
            // Expect
            XCTAssertEqual(root, expectedRoot)
            XCTAssertEqual(heap.contents, expectedContents)
        }
        
        let testcases = [
            (input: [], expectedRoot: nil, expectedContents: []),
            (input: [5], expectedRoot: 5, expectedContents: []),
            (input: [5,2,1], expectedRoot: 5, expectedContents: [2,1]),
            (input: [6,5,1,2], expectedRoot: 6, expectedContents: [5,2,1]),
            (input: [6,5,1,2,4], expectedRoot: 6, expectedContents: [5,4,1,2]),
            (input: [6,5,3,2,4,1], expectedRoot: 6, expectedContents: [5,4,3,2,1]),
            ]
        
        testcases.forEach {
            // let (input, expectedRoot, expectedContents) = tuple
            test(input: $0.input, expectedRoot: $0.expectedRoot, expectedContents: $0.expectedContents)
        }
        
    }
    
    private func expect(_ expression: @autoclosure () -> Bool) {
        XCTAssert(expression())
    }
    
}




