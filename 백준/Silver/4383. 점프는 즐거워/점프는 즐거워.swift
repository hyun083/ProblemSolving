import Foundation

while let line = readLine(){
    let input = line.split(separator: " ").map{Int($0)!}
    let N = input[0]
    let arr = Array(input[1...])
    if N == 1{
        print("Jolly")
    }else{
        var diff = Set<Int>()
        for i in 1..<N{
            let d = abs(arr[i] - arr[i-1])
            diff.insert(d)
        }
        let expected = Set(1..<N)
        print(diff == expected ? "Jolly" : "Not jolly")
    }
}