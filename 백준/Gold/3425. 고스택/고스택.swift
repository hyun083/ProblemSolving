import Foundation

struct Gostack{
    var stack:[Int]
    let INF = 1000000000
    
    mutating func num(_ x:Int){
        stack.append(x)
    }
    
    mutating func pop() -> Bool{
        if stack.isEmpty{
            return false
        }else{
            stack.removeLast()
            return true
        }
    }
    
    mutating func inv() -> Bool{
        if stack.isEmpty{
            return false
        }else{
            stack[stack.count-1] *= -1
            return true
        }
    }
    
    mutating func dup() -> Bool{
        if stack.isEmpty{
            return false
        }else{
            stack.append(stack.last!)
            return true
        }
    }
    
    mutating func swp() -> Bool{
        if stack.count < 2{
            return false
        }else{
            stack.swapAt(stack.count-1, stack.count-2)
            return true
        }
    }
    
    mutating func add() -> Bool{
        if stack.count < 2{
            return false
        }else{
            let a = stack.removeLast()
            let b = stack.removeLast()
            let res = a+b
            
            if abs(res) > INF { return false}
            stack.append(res)
            return true
        }
    }
    
    mutating func sub() -> Bool{
        if stack.count < 2{
            return false
        }else{
            let a = stack.removeLast()
            let b = stack.removeLast()
            let res = b-a
            
            if abs(res) > INF { return false}
            stack.append(res)
            return true
        }
    }
    
    mutating func mul() -> Bool{
        if stack.count < 2{
            return false
        }else{
            let a = stack.removeLast()
            let b = stack.removeLast()
            let res = a*b
            
            if abs(res) > INF { return false}
            stack.append(res)
            return true
        }
    }
    
    mutating func div() -> Bool{
        if stack.count < 2{
            return false
        }else{
            let a = stack.removeLast()
            let b = stack.removeLast()
            
            if a==0 { return false }
            var res = abs(b)/abs(a)
            
            if abs(res) > INF { return false}
            if b<0&&a>0 || b>0&&a<0{
                res *= -1
            }
            stack.append(res)
            return true
        }
    }
    
    mutating func mod() -> Bool{
        if stack.count < 2{
            return false
        }else{
            let a = stack.removeLast()
            let b = stack.removeLast()
            
            if a==0 { return false }
            var res = abs(b)%abs(a)
            
            if abs(res) > INF { return false}
            if b<0{res *= -1}
            stack.append(res)
            return true
        }
    }
}

while let line = readLine(){
    if line == "QUIT"{ break }
    if line == ""{ continue }
    
    var arr = [line.split(separator: " ").map{String($0)}]
    while arr.last! != ["END"]{
        let cmd = readLine()!
        arr.append(cmd.split(separator: " ").map{String($0)})
    }
    arr.removeLast()
    
    let N = Int(readLine()!)!
    for _ in 0..<N{
        let num = Int(readLine()!)!
        var stk = Gostack(stack: [num])
        var ans = "ERROR"
        var flag = true
        
        for cmd in arr{
            if cmd[0] == "NUM"{
                stk.num(Int(cmd[1])!)
            }else if cmd[0] == "POP"{
                if stk.pop(){
                    continue
                }else{
                    flag = false
                    break
                }
            }else if cmd[0] == "INV"{
                if stk.inv(){
                    continue
                }else{
                    flag = false
                    break
                }
            }else if cmd[0] == "DUP"{
                if stk.dup(){
                    continue
                }else{
                    flag = false
                    break
                }
            }else if cmd[0] == "SWP"{
                if stk.swp(){
                    continue
                }else{
                    flag = false
                    break
                }
            }else if cmd[0] == "ADD"{
                if stk.add(){
                    continue
                }else{
                    flag = false
                    break
                }
            }else if cmd[0] == "SUB"{
                if stk.sub(){
                    continue
                }else{
                    flag = false
                    break
                }
            }else if cmd[0] == "MUL"{
                if stk.mul(){
                    continue
                }else{
                    flag = false
                    break
                }
            }else if cmd[0] == "DIV"{
                if stk.div(){
                    continue
                }else{
                    flag = false
                    break
                }
            }else if cmd[0] == "MOD"{
                if stk.mod(){
                    continue
                }else{
                    flag = false
                    break
                }
            }else{
                continue
            }
        }
        if flag && stk.stack.count == 1{
            ans = String(stk.stack[0])
        }
        print(ans)
    }
    print()
}