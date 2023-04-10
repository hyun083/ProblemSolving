import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let T = inputs[1]
let G = inputs[2]

var map = Array(repeating: false, count: 100000)
let n = [1,2]
func bfs(from dept:Int, to dest:Int) -> Int{
    var cnt = 0
    var eq = [Int]()
    var dq = [Int]()
    eq.append(dept)
    map[dept] = true
    
    while(!eq.isEmpty){
        cnt += 1
        dq = eq.reversed()
        eq.removeAll()
        for _ in 1...dq.count{
            let curr = dq.removeLast()
            
            for i in 0...1{
                var next = curr + n[i]
                if i == 1 {
                    next = curr * n[i]
                    if next > 99999 {
                        continue
                    }
                    if next / 10000 >= 1{
                        next -= 10000
                    }else if next / 1000 >= 1{
                        next -= 1000
                    }else if next / 100 >= 1{
                        next -= 100
                    }else if next / 10 >= 1{
                        next -= 10
                    }else if next > 0{
                        next -= 1
                    }else{
                        next = 0
                    }
                }
                if(next > 99999){ continue }
                if( next == dest){ return cnt}
                
                if( map[next] == false){
                    map[next] = true
                    eq.append(next)
                }
            }
        }
    }
    return -1
}

let res = bfs(from: N, to: G)

if(N==G){
    print(0)
}else if res == -1 || res > T{
    print("ANG")
}else{
    print(res)
}