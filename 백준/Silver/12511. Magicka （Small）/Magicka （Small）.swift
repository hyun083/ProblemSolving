import Foundation

let T = Int(readLine()!)!
for t in 1...T {
    var line:[String] = readLine()!.split(separator: " ").map{String($0)}.reversed()
    var stk = [String]()
    var combineWith = Dictionary<String, String>()
    var oppositeOf = Dictionary<String, String>()
    
    let C = Int(line.removeLast())!
    for _ in stride(from: 0, to: C, by: +1){
        let str = line.removeLast().map{String($0)}
        combineWith[str[0]+str[1]] = str[2]
        combineWith[str[1]+str[0]] = str[2]
    }
    
    let D = Int(line.removeLast())!
    for _ in stride(from: 0, to: D, by: +1) {
        let str = line.removeLast().map{String($0)}
        oppositeOf[str[0]] = str[1]
        oppositeOf[str[1]] = str[0]
    }
    
    let _ = Int(line.removeLast())!
    let arr = line.removeLast().map{String($0)}
    
    for element in arr {
        if stk.isEmpty {
            stk.append(element)
        } else {
            let top = stk.last!
            if let combine = combineWith[top+element] {
                stk.removeLast()
                stk.append(combine)
            } else if let combine = combineWith[element+top] {
                stk.removeLast()
                stk.append(combine)
            } else {
                stk.append(element)
            }
            
            for i in 0..<stk.count-1 {
                if stk.isEmpty { break }
                for k in i+1..<stk.count {
                    if stk[i] == oppositeOf[stk[k]] {
                        stk = []
                        break
                    }
                }
            }
        }
    }
    print("Case #\(t): [\(stk.joined(separator: ", "))]")
}