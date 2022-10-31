import XCTest

@testable import ThumbnailView

public final class ThumbnailViewTests: XCTestCase {
    
    private var thumbnailView: ThumbnailView?
    
    public override func setUp() {
        super.setUp()
        
        self.thumbnailView = ThumbnailView()
    }
    
    public override func tearDown() {
        super.tearDown()
        
        self.thumbnailView = nil
    }
    
    public func testIsLoading() throws {
        let thumbnailView = try XCTUnwrap(self.thumbnailView)
        XCTAssertTrue(thumbnailView.isLoading)
    }
    
    public func testSetImage() throws {
        let thumbnailView = try XCTUnwrap(self.thumbnailView)
        thumbnailView.image = UIImage()
        XCTAssertFalse(thumbnailView.isLoading)
    }
    
    public func testUnsetImage() throws {
        let thumbnailView = try XCTUnwrap(self.thumbnailView)
        thumbnailView.image = nil
        XCTAssertTrue(thumbnailView.isLoading)
    }
}
