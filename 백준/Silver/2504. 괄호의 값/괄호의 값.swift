import Foundation

let line = readLine()!.map{String($0)}
var ans = 0
var tmp = 1
var stk = [String]()
var flag = true

for i in 0..<line.count{
    let curr =  line[i]
    
    if curr == "("{
        tmp *= 2
        stk.append(curr)
    }else if curr == ")"{
        if stk.isEmpty || stk.last! != "("{
            ans = 0
            break
        }
        let pre = line[i-1]
        if pre == "("{
            ans += tmp
            tmp /= 2
        }else{
            tmp /= 2
        }
        stk.removeLast()
        
    }
    
    if curr == "["{
        tmp *= 3
        stk.append(curr)
    }else if curr == "]"{
        if stk.isEmpty || stk.last != "["{
            ans = 0
            break
        }
        let pre = line[i-1]
        if pre == "["{
            ans += tmp
            tmp /= 3
        }else{
            tmp /= 3
        }
        stk.removeLast()
    }
}

print(stk.isEmpty ? ans:0)