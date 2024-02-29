@testable import MovieSoftek

class DispatchQueueMock: DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void) {
        work()
    }
}
