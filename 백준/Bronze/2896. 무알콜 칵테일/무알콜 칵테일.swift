import Foundation

let ABC = readLine()!.split(separator: " ").map{Double($0)!}

let IJK = readLine()!.split(separator: " ").map{Double($0)!}

var tmp:Double = 500

for i in 0..<3{
    if tmp > ABC[i]/IJK[i]{
        tmp = ABC[i]/IJK[i]
    }
}

for i in 0..<3{
    print(ABC[i]-tmp*IJK[i],terminator: " ")
}
