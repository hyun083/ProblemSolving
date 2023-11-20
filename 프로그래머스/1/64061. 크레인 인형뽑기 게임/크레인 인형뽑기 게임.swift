import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    let N = board.count
    var arr = Array(repeating: [Int](), count: N)
    var stk = [Int]()
    var ans = 0
    
    for i in 0..<N{
        for k in 0..<N{
            if board[k][i] == 0 { continue }
            arr[i].append(board[k][i])
        } 
        arr[i] = Array(arr[i].reversed())
    }
    
    for move in moves{
        let idx = move-1
        if arr[idx].isEmpty{ continue }
        let target = arr[idx].removeLast()

        if stk.isEmpty{
            stk.append(target)
        }else{
            if stk.last! == target{
                ans += 2
                stk.removeLast()
            }else{
                stk.append(target)
            }
        }
    }
    
    return ans
}