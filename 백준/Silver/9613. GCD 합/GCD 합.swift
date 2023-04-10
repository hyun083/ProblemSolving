import Foundation

func gcd(a:UInt64,b:UInt64) -> UInt64{
    if b==0{
        return a
    }else{
        return gcd(a: b, b: a%b)
    }
}

for _ in 0..<Int(readLine()!)!{
    let numbers = readLine()!.split(separator: " ").map{UInt64(String($0))!}
    var ans:UInt64 = 0
    for curr in 1..<numbers.count-1{
        for next in curr+1..<numbers.count{
            ans += gcd(a: numbers[curr], b: numbers[next])
        }
    }
    print(ans)
}