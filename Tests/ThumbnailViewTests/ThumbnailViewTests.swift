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
    
    func testIsLoading() throws {
        let thumbnailView = try XCTUnwrap(self.thumbnailView)
        XCTAssertTrue(thumbnailView.isLoading)
    }
    
    func testSetImage() throws {
        let thumbnailView = try XCTUnwrap(self.thumbnailView)
        thumbnailView.image = UIImage()
        XCTAssertFalse(thumbnailView.isLoading)
    }
    
    func testUnsetImage() throws {
        let thumbnailView = try XCTUnwrap(self.thumbnailView)
        thumbnailView.image = nil
        XCTAssertTrue(thumbnailView.isLoading)
    }
}
