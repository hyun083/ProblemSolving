import Foundation

let K = Int(readLine()!)!
for k in 1...K {
    let data = readLine()!.map{String($0)}
    var stk = [String]()
    
    for data in data {
        if stk.isEmpty {
            stk.append(data)
        } else if data=="l" && stk.last=="r"{
            stk.removeLast()
        } else if data=="r" && stk.last=="l"{
            stk.removeLast()
        } else if data=="u" && stk.last=="d"{
            stk.removeLast()
        } else if data=="d" && stk.last=="u"{
            stk.removeLast()
        } else {
            stk.append(data)
        }
    }
    print("Data Set \(k):")
    print(stk.isEmpty ? "Yes":"No")
    print()
}