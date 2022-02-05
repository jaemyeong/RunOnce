import Foundation

public class RunOnceToken {
    @RunOnceGlobalActor
    public private(set) var isExpired: Bool
    
    public init() {
        self.isExpired = false
    }
    
    @discardableResult
    public func callAsFunction(_ operation: @escaping @Sendable () -> Void) -> Task<Void, Never> {
        Task { @RunOnceGlobalActor in
            guard !self.isExpired else {
                return
            }
            
            operation()
            
            self.isExpired = true
        }
    }
    
    @discardableResult
    public func callAsFunction(_ operation: @escaping @Sendable () async -> Void) -> Task<Void, Never> {
        Task { @RunOnceGlobalActor in
            guard !self.isExpired else {
                return
            }
            
            await operation()
            
            self.isExpired = true
        }
    }
    
    @discardableResult
    public func callAsFunction(_ operation: @escaping @Sendable () throws -> Void) -> Task<Void, Error> {
        Task { @RunOnceGlobalActor in
            guard !self.isExpired else {
                return
            }
            
            try operation()
            
            self.isExpired = true
        }
    }
    
    @discardableResult
    public func callAsFunction(_ operation: @escaping @Sendable () async throws -> Void) -> Task<Void, Error> {
        Task { @RunOnceGlobalActor in
            guard !self.isExpired else {
                return
            }
            
            try await operation()
            
            self.isExpired = true
        }
    }
}
