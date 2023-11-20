import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    func matched(a:String, b:String) -> Bool{
        let A = a.map{String($0)}
        let B = b.map{String($0)}
        let S = A.count
        if A.count != B.count { return false }
        
        for i in 0..<S{
            if B[i] == "*"{ continue }
            if A[i] != B[i]{ return false }
        }
        return true
    }
    
    let N = user_id.count
    let M = banned_id.count
    var cnt = Array(repeating: 0, count:M)
    var visited = Array(repeating:false, count:N)
    var ans = Set<Set<String>>()
    
    func dfs(currArr: [String]){
        var arr = currArr

        if currArr.count == M{
            for i in 0..<M{
                if !matched(a:arr[i], b:banned_id[i]){
                    return
                }
            }
            ans.insert(Set(arr))
            return
        }
        
        for i in 0..<N{
            if !visited[i]{
                visited[i] = true
                arr.append(user_id[i])
                dfs(currArr: arr)
                arr.removeLast()
                visited[i] = false
            }
        }
    }
    
    for i in 0..<N{
        if !visited[i]{
            visited[i] = true
            dfs(currArr: [user_id[i]])
            visited[i] = false
        }
    }
    return ans.count
}