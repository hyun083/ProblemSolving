import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    var res = [String]()
    var note = [Int:Bool]()
    
    let N = Int(readLine()!)!
    for num in readLine()!.split(separator: " ").map({Int($0)!}){
        note[num] = true
    }
    
    let M = Int(readLine()!)!
    for ans in readLine()!.split(separator: " ").map({Int($0)!}){
        if note[ans] == nil{
            res.append("0")
        }else{
            res.append("1")
        }
    }
    print(res.joined(separator: "\n"))
}