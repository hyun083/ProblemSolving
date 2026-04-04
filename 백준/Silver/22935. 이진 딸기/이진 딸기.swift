import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    var num = Int(readLine()!)! % 28
    num += num==0 ? 2:0
    
    if num > 15 {
        num = 15-(num%15)
    }
    
    let binString = String(num,radix: 2)
    let res = String(format: "%04d", Int(binString)!).map{String($0)}
    
    var output = ""
    for r in res {
        output += r=="0" ? "V":"딸기"
    }
     
    print(output)
}