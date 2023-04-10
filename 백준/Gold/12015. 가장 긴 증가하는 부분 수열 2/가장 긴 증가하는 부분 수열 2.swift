import Foundation

func solution12015() {
    
    var A = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    var dp = [Int]()
    
    func getLowerBound(_ find: Int, containList: [Int]) -> Int {
        var left = 0
        var right = containList.count - 1
        var mid = 0
        
        while left < right {
            mid = (left + right) / 2
            
            if containList[mid] < find {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return right
    }
    
    
    for i in 0 ..< A {
        if dp.isEmpty || dp.last! < arr[i] {
            dp.append(arr[i])
        } else {
            var index = getLowerBound(arr[i], containList: dp)
            dp[index] = arr[i]
            
        }
    }
    
    print(dp.count)
}
solution12015()