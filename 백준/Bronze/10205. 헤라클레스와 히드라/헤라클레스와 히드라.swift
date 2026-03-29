import Foundation

let K = Int(readLine()!)!
for k in 1...K {
    var H = Int(readLine()!)!
    let cmd = readLine()!.map{String($0)}
    for cmd in cmd {
        H += cmd=="c" ? 1:-1
    }
    print("Data Set \(k):")
    print(H)
    print()
}