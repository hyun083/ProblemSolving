import Foundation

let (A,B,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0],$0[1],$0[2])}[0]
var ans = Set<Int>()
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: C+1), count: B+1), count: A+1)

func dfs(_ a:Int,_ b:Int,_ c:Int){
    if a==0{ ans.insert(c) }
    
    if a+b<=B{
        if !visited[0][a+b][c]{
            visited[0][a+b][c] = true
            dfs(0, a+b, c)
        }
    }else if !visited[a+b-B][B][c]{
        visited[a+b-B][B][c] = true
        dfs(a+b-B, B, c)
    }
    
    if a+c<=C{
        if !visited[0][b][a+c]{
            visited[0][b][a+c] = true
            dfs(0, b, a+c)
        }
    }else if !visited[a+c-C][b][C]{
        visited[a+c-C][b][C] = true
        dfs(a+c-C, b, C)
    }
    
    if b+a<=A{
        if !visited[b+a][0][c]{
            visited[b+a][0][c] = true
            dfs(b+a, 0, c)
        }
    }else if !visited[A][b+a-A][c]{
        visited[A][b+a-A][c] = true
        dfs(A, b+a-A, c)
    }
    
    if b+c<=C{
        if !visited[a][0][b+c]{
            visited[a][0][b+c] = true
            dfs(a, 0, b+c)
        }
    }else if !visited[a][b+c-C][C]{
        visited[a][b+c-C][C] = true
        dfs(a, b+c-C, C)
    }
    
    if c+a<=A{
        if !visited[c+a][b][0]{
            visited[c+a][b][0] = true
            dfs(c+a, b, 0)
        }
    }else if !visited[A][b][c+a-A]{
        visited[A][b][c+a-A] = true
        dfs(A, b, c+a-A)
    }
    
    if c+b<=B{
        if !visited[a][c+b][0]{
            visited[a][c+b][0] = true
            dfs(a, c+b, 0)
        }
    }else if !visited[a][B][c+b-B]{
        visited[a][B][c+b-B] = true
        dfs(a, B, c+b-B)
    }
}

dfs(0, 0, C)
for ans in ans.sorted(){
    print(ans,terminator: " ")
}