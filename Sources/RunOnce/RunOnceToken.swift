import Foundation

public class RunOnceToken {
    @RunOnceGlobalActor
    public private(set) var isExpired: Bool
    
    public init() {
        self.isExpired = false
    }
    
    @discardableResult
    public func callAsFunction(_ operation: @escaping () -> Void) -> Task<Void, Never> {
        Task { @RunOnceGlobalActor in
            guard !self.isExpired else {
                return
            }
            
            operation()
            
            self.isExpired = true
        }
    }
    
    @discardableResult
    public func callAsFunction(_ operation: @escaping () async -> Void) async -> Task<Void, Never> {
        Task { @RunOnceGlobalActor in
            guard !self.isExpired else {
                return
            }
            
            await operation()
            
            self.isExpired = true
        }
    }
}
