import Foundation

let(A,B) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]

func gcd(x:Int, y:Int) -> Int{
    let a = max(x, y)
    let b = min(x, y)
    
    if a%b == 0{
        return b
    }else{
        return gcd(x: b, y: a%b)
    }
}

let R = gcd(x: A, y: B)
print(A*B/R)