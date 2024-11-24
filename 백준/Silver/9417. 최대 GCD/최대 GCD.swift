import Foundation

let N = Int(readLine()!)!

func GCD(a:Int, b:Int)->Int{
    let remain = a%b
    if remain == 0{
        return b
    }else{
        return GCD(a: b, b: remain)
    }
}

for _ in 0..<N{
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    var result:Int = 0
    for i in 0..<arr.count-1{
        for k in i+1..<arr.count{
            let gcd = GCD(a: arr[i], b: arr[k])
            result = max(result, gcd)
        }
    }
    print(result)
}