import Foundation

extension URLSession {
    private enum Constants {
        static let memoryCapacity = 10 * 1024 * 1024
        static let diskCapacity = 100 * 1024 * 1024
        static let timeoutInterval: TimeInterval = 15
    }

    public static let sharedImage: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = URLCache(memoryCapacity: Constants.memoryCapacity, diskCapacity: Constants.diskCapacity)
        configuration.timeoutIntervalForRequest = Constants.timeoutInterval
        configuration.httpAdditionalHeaders = ["Accept": "image/*"]

        return URLSession(configuration: configuration)
    }()

    public static var stubbed: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [HTTPStubProtocol.self]

        return URLSession(configuration: configuration)
    }
}
