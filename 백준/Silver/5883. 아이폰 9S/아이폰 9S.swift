import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
func countOfLongestSequence(_ nums: [Int],except: Int) -> Int {
    var tmp = nums
    tmp.removeAll(where: {$0==except})
    var count: Int = 1
    var maxCount: Int = 0
    
    for i in 1..<tmp.count{
        if tmp[i-1] == tmp[i]{
            count += 1
        }else{
            maxCount = max(maxCount,count)
            count = 1
        }
    }
    maxCount = max(maxCount,count)
    return maxCount
}

let numbers = Set(arr)
var ans = 0
for num in numbers{
    ans = max(ans,countOfLongestSequence(arr, except: num))
}
print(ans)