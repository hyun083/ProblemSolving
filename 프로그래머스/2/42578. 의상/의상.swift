import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var answer = 0
    var dic = Dictionary<String,Int>()
    
    for cloth in clothes{
        if dic[cloth[1]] == nil{
            dic[cloth[1]] = 2
        }else{
            dic[cloth[1]]! += 1
        }
    }
    
    if dic.count > 1{
        answer += dic.values.reduce(1, {$0 * $1})-1
    }else{
        answer += dic.values.reduce(0, +)-1
    }

    return answer
}