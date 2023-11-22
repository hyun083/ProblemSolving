import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    let N = stones.count
    var left = 1
    var right = 200000000
    var ans = 0
    
    while left<=right{
        let mid = (left+right)/2
        var cnt = 0
        
        for i in 0..<N{
            if stones[i] <= mid{
                cnt += 1
            }else{
                cnt = 0
            }
            
            if cnt == k{ break }
        }
        
        if cnt==k {
            right = mid-1
        }else{
            left = mid+1
        }
    }

    return left
}