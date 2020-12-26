import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Soyeon_packageTests.allTests),
    ]
}
#endif
