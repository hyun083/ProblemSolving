import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    var dic = Dictionary<String,Int>()
    var ans = Int.max
    
    let item = readLine()!.split(separator: ",")
    let score = readLine()!.split(separator: "|")
    
    for str in item{
        let tmp = str.split(separator: ":").map{String($0)}
        dic[tmp[0]] = Int(tmp[1])!
    }
    
    for str in score{
        var res = 0
        for key in str.split(separator: "&"){
            res = max(res, dic[String(key)]!)
        }
        ans = min(ans, res)
    }
    print(ans)
}