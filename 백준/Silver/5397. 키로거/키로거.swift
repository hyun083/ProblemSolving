import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = readLine()!.map{String($0)}
    var stk = [String]()
    var tmp = [String]()
    
    for input in N{
        if input == "<"{
            if stk.isEmpty{ continue }
            tmp.append(stk.removeLast())
        }else if input == ">"{
            if tmp.isEmpty{ continue }
            stk.append(tmp.removeLast())
        }else if input == "-"{
            if stk.isEmpty{ continue }
            stk.removeLast()
        }else{
            stk.append(input)
        }
    }
    if !tmp.isEmpty{
        stk+=Array(tmp.reversed())
    }
    print(stk.joined())
}