import Foundation

let N = Int(readLine()!)!
var padding = (N-2)*2+1

func printStroke(cnt:Int, N:Int, padding:Int){
    print(String(repeating: " ", count: cnt),terminator: "")
    
    print("*",terminator: "")
    print(String(repeating: " ", count: N-2),terminator: "")
    print("*",terminator: "")
    
    print(String(repeating: " ", count: padding),terminator: "")
    
    print("*",terminator: "")
    print(String(repeating: " ", count: N-2),terminator: "")
    print("*")
}

func printFill(N:Int){
    print(String(repeating: "*", count: N),terminator: "")
    print(String(repeating: " ", count: padding),terminator: "")
    print(String(repeating: "*", count: N))
}

if N < 2 {
    
} else {
    printFill(N: N)
    padding -= 2

    for cnt in 1..<N-1{
        printStroke(cnt: cnt, N: N, padding: padding)
        padding -= 2
    }
    
    print(String(repeating: " ", count: N-1),terminator: "")
    print("*",terminator: "")
    print(String(repeating: " ", count: N-2),terminator: "")
    print("*",terminator: "")
    print(String(repeating: " ", count: N-2),terminator: "")
    print("*")
    
    padding = 1
    for cnt in stride(from: N-2, through: 1, by: -1) {
        printStroke(cnt: cnt, N: N, padding: padding)
        padding += 2
    }
    printFill(N: N)
}