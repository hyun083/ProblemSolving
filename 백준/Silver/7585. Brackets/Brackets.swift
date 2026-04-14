import Foundation

while let line = readLine() {
    if line == "#" { break }
    var stk = [String]()
    var ans = true
    
    for str in line.map({String($0)}) {
        if str == "{" || str == "(" || str == "["{
            stk.append(str)
        } else if str == "}" {
            if !stk.isEmpty && stk.last! == "{"{
                stk.removeLast()
            } else {
                ans = false
            }
        } else if str == ")" {
            if !stk.isEmpty && stk.last! == "("{
                stk.removeLast()
            } else {
                ans = false
            }
        } else if str == "]" {
            if !stk.isEmpty && stk.last! == "["{
                stk.removeLast()
            } else {
                ans = false
            }
        } else {
            continue
        }
        if ans == false { break }
    }
    print(stk.isEmpty && ans ? "Legal" : "Illegal")
}