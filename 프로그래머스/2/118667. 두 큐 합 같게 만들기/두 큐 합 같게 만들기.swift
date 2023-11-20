import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var arr = queue1+queue2
    var N = arr.count
    var ans = -1
    var start = 0
    var end = queue1.count
    var sum1 = queue1.reduce(0,+)
    var sum2 = queue2.reduce(0,+)
    var cnt = 0
    
    while start < end && end<N{
        if sum1 < sum2{
            sum1 += arr[end]
            sum2 -= arr[end]
            end += 1
        }else if sum1 == sum2{
            ans = cnt
            break
        }else{
            sum1 -= arr[start]
            sum2 += arr[start]
            start += 1
        }
        cnt += 1
    }
    
    return ans
}