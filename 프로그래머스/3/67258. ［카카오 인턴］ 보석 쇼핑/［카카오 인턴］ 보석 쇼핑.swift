import Foundation

func solution(_ gems:[String]) -> [Int] {
    let N = gems.count
    var ans = [1,N]
    let target = Set(gems)
    var info = Dictionary<String,Int>()
    var currCnt = 0
    
    for gem in target{
        info[gem] = 0
    }
    
    var start = 0
    var end = 1
    
    info[gems[0]]! += 1
    currCnt += 1
    
    while end<=N && start<end{
        if end==N || currCnt>=target.count{
            if currCnt==target.count && (end-1)-start < ans[1]-ans[0]{
                ans = [start+1,end]
            }
            info[gems[start]]! -= 1
            if info[gems[start]]! == 0{
                currCnt -= 1
            }
            start += 1
        }else{
            if info[gems[end]]! == 0{
                currCnt += 1
            }
            info[gems[end]]! += 1
            end += 1
        }
    }
    if currCnt == target.count{
        
    }
    return ans
}