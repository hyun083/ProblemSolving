import Foundation

func solution(_ s:String) -> [Int] {
    var dic = Dictionary<Int,Int>()
    var ans = [Int]()
    let arr = s.split(separator: "{").map{String($0)}.joined()
    .split(separator: "}").map{String($0)}.joined()
    .split(separator: ",").map{String($0)}
    
    
    for str in arr{
        if let num = Int(str){
            if dic[num] == nil{
                dic[num] = 1
            }else{
                dic[num]! += 1
            }
        }
    }
    
    for num in dic.sorted(by: {$0.value > $1.value}){
        ans.append(num.key)
    }
    return ans
}