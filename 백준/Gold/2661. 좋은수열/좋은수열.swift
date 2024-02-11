import Foundation

let N = Int(readLine()!)!
var dx = ["1","2","3"]
var ans = ""

func btk(from arr:[String]){
    if ans.count > 0 { return }
    let n = arr.count
    if n>1{
        for size in 1...n/2{
            let pre = arr[n-size-size..<n-size]
            let post = arr[n-size..<n]
            if pre == post{ return }
        }
    }
    
    if arr.count == N{
        ans = arr.joined()
        return
    }
    
    var res = arr
    for next in dx{
        res.append(next)
        btk(from: res)
        res.removeLast()
    }
}

btk(from: [])
print(ans)