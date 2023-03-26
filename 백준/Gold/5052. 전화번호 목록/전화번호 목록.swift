import Foundation

let T = Int(readLine()!)!
var ans = [String]()

for _ in 0..<T{
    var flag = true
    let N = Int(readLine()!)!
    var numbers = [String]()
    for _ in 0..<N{
        numbers.append(readLine()!)
    }
    numbers.sort(by: {$0<$1})
    
    for i in 0..<N-1{
        let pre = numbers[i]
        let post = numbers[i+1]
        if post.starts(with: pre){
            flag = false
            break
        }
    }
    if flag{
        ans.append("YES")
    }else{
        ans.append("NO")
    }
}
print(ans.joined(separator: "\n"))