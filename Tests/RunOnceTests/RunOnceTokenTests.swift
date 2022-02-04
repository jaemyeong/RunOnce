import XCTest

@testable import RunOnce

public final class RunOnceTokenTests: XCTestCase {
    private var counter: Int = 0
    
    public override func setUp() {
        super.setUp()
        
        self.counter = 0
    }
    
    public override func tearDown() {
        super.tearDown()
        
        self.counter = 0
    }
    
    public func testSync() {
        let expectation = self.expectation(description: #function)
        
        let onceToken = RunOnceToken()
        
        onceToken {
            self.counter += 1
            expectation.fulfill()
        }
        
        onceToken {
            self.counter += 1
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 10.0)
        
        XCTAssertEqual(self.counter, 1)
    }
    
    public func testAsync() async {
        let onceToken = RunOnceToken()
        
        await onceToken {
            self.counter += 1
        }
        .value
        
        let isExpired = await onceToken.isExpired

        XCTAssertTrue(isExpired)
        
        await onceToken {
            self.counter += 1
        }
        .value
        
        XCTAssertEqual(self.counter, 1)
    }
}
