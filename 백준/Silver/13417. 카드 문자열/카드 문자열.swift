import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{String($0)}
    var ans = [String]()
    
    for i in 0..<N{
        let curr = arr[i]
        if ans.isEmpty{
            ans.append(curr)
        }else if curr <= ans[0]{
            ans.insert(curr, at: 0)
        }else{
            ans.append(curr)
        }
    }
    print(ans.joined())
}