public class HomeRepository {
    static public func cleanCoversCache() -> Bool{
        return FileHelper.clearCoversCache()
    }
}
