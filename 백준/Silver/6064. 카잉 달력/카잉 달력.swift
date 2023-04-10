import Foundation

let T = Int(readLine()!)!

func gcd(num1:Int, num2:Int) -> Int{
    var a = num1
    var b = num2
    while b != 0{
        let temp = a % b
        a = b
        b = temp
    }
    return a
}

func lcm(num1:Int, num2:Int) -> Int{
    return num1 * num2 / gcd(num1: num1, num2: num2)
}
var result = ""
for _ in 0..<T{
    let MNxy = readLine()!.split(separator: " ").map{Int(String($0))!}
    let M = MNxy[0]
    let N = MNxy[1]
    let x = MNxy[2]
    let y = MNxy[3]
    
    var cnt = x%(M+1)
    var tempY = x
    for _ in 0..<N{
        let tY = tempY % N == 0 ? N:tempY % N
        if tY == y{
            break
        }
        tempY = tY + M
        cnt += M
    }
    
    result += cnt>lcm(num1: M, num2: N) ? "-1\n" : String(cnt)+"\n"
}
print(result)