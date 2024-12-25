import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    let res = String(String(N*N).reversed())
    
    if res.starts(with: String(N).reversed()){
        print("YES")
    }else{
        print("NO")
    }
}
