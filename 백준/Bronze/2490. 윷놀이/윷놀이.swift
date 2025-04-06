import Foundation

for _ in 0..<3{
    let info = readLine()!.split(separator: " ").map{Int($0)!}.reduce(0,+)
    if info == 3{
        print("A")
    }else if info == 2{
        print("B")
    }else if info == 1{
        print("C")
    }else if info == 0{
        print("D")
    }else{
        print("E")
    }
}