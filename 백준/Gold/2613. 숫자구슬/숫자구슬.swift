
import Foundation

var (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var lo = 1
var hi = Int.max/2
var ans = Int.max
var ansArr = [Int]()

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0
    var sum = arr[0]
    var res = 0
    var tmpArr = [Int]()
    var tmpCnt = 1
    
    for i in 1..<N{
        let n = arr[i]
        if sum+n <= mid{
            tmpCnt += 1
            sum += n
        }else{
            cnt += 1
            res = max(res, sum)
            tmpArr.append(tmpCnt)
            tmpCnt = 1
            sum = n
        }
    }
    res = max(res, sum)
    tmpArr.append(tmpCnt)
    cnt += 1
    
    if cnt <= M{
        ansArr = tmpArr
        ans = res
        hi = mid-1
    }else{
        lo = mid+1
    }
}
print(ans)
for num in ansArr{
    var num = num
    while num>1 && ansArr.count<M{
        print(1,terminator: " ")
        num -= 1
        M -= 1
    }
    print(num, terminator: " ")
}
