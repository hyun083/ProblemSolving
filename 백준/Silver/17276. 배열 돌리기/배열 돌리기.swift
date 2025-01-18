import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let ND = readLine()!.split(separator: " ").map{Int($0)!}
    let N = ND[0]
    var D = ND[1]
    var arr = [[Int]]()
    var tmp = [[Int]]()
    
    for _ in 0..<N{
        let info = readLine()!.split(separator: " ").map{Int($0)!}
        arr.append(info)
    }
    
    func clockWise(){
        tmp = arr
        //diagnal -> vertical
        for i in 0..<N{
            tmp[i][N/2] = arr[i][i]
        }
        
        //horizontal -> diagnal
        for k in 0..<N{
            tmp[k][k] = arr[N/2][k]
        }
        
        //diagnal -> horizontal
        for i in 0..<N{
            tmp[N/2][N-1-i] = arr[i][N-1-i]
        }
        
        //vertical -> diagnal
        for i in 0..<N{
            tmp[i][N-1-i] = arr[i][N/2]
        }
        arr = tmp
    }
    
    func antiClockWise(){
        tmp = arr
        //diagnal <- vertical
        for i in 0..<N{
            let k = N/2
            tmp[i][i] = arr[i][k]
        }
        
        //horizontal <= diagnal
        for k in 0..<N{
            let i = N/2
            tmp[i][k] = arr[k][k]
        }
        
        //diagnal <- horizontal
        for i in 0..<N{
            tmp[N-1-i][i] = arr[N/2][i]
        }
        
        //vertical <- diagnal
        for i in 0..<N{
            tmp[i][N/2] = arr[i][N-1-i]
        }
        arr = tmp
    }
     
    if D<0{
        D *= -1
        for _ in 0..<D/45{
            antiClockWise()
        }
    }else{
        for _ in 0..<D/45{
            clockWise()
        }
    }
     
    for ans in arr{
        for num in ans{
            print(num, terminator: " ")
        }
        print()
    }
}
