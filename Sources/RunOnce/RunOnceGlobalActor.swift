import Foundation

@globalActor
public struct RunOnceGlobalActor {
    public actor RunOnceActor {}
    
    public static let shared: RunOnceActor = RunOnceActor()
}
