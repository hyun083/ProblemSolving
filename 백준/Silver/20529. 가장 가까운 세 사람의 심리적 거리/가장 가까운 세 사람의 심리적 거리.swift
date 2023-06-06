import Foundation

let T = Int(readLine()!)!

func distance(a:[String], b:[String], c:[String]) -> Int{
    var res = 0
    for i in 0..<4{
        res += a[i]==b[i] ? 0:1
        res += b[i]==c[i] ? 0:1
        res += c[i]==a[i] ? 0:1
    }
    return res
}

for _ in 0..<T{
    let N = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{String($0)}.sorted()
    var ans = Int.max
    
    if N > 32{
        print(0)
        continue
    }
    
    for i in 0..<N-2{
        for k in i+1..<N-1{
            for m in k+1..<N{
                let a = arr[i].map{String($0)}
                let b = arr[k].map{String($0)}
                let c = arr[m].map{String($0)}
                ans = min(ans, distance(a: a, b: b, c: c))
            }
        }
    }
    print(ans)
}