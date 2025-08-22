import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!-1}
let N = NM[0]
let M = NM[1]

var arr = Array(repeating: Array(repeating: false, count: 2), count: 4)
arr[N][M] = true

let K = Int(readLine()!)!
let CMD = readLine()!.map{String($0)}

func swap(x1: Int, y1: Int, x2: Int, y2: Int){
    let tmp = arr[x1][y1]
    arr[x1][y1] = arr[x2][y2]
    arr[x2][y2] = tmp
}

func A(){
    swap(x1: 0, y1: 0, x2: 2, y2: 0)
    swap(x1: 0, y1: 1, x2: 2, y2: 1)
    swap(x1: 1, y1: 0, x2: 3, y2: 0)
    swap(x1: 1, y1: 1, x2: 3, y2: 1)
}

func B(){
    swap(x1: 0, y1: 0, x2: 1, y2: 1)
    swap(x1: 0, y1: 1, x2: 1, y2: 0)
    swap(x1: 2, y1: 0, x2: 3, y2: 1)
    swap(x1: 2, y1: 1, x2: 3, y2: 0)
}

func C(){
    swap(x1: 0, y1: 0, x2: 3, y2: 1)
    swap(x1: 0, y1: 1, x2: 3, y2: 0)
    swap(x1: 1, y1: 0, x2: 2, y2: 1)
    swap(x1: 1, y1: 1, x2: 2, y2: 0)
}

func D(){
    let tmp = arr[0][0]
    arr[0][0] = arr[1][0]
    arr[1][0] = arr[2][0]
    arr[2][0] = arr[3][0]
    arr[3][0] = arr[3][1]
    arr[3][1] = arr[2][1]
    arr[2][1] = arr[1][1]
    arr[1][1] = arr[0][1]
    arr[0][1] = tmp
}

for cmd in CMD{
    if cmd == "A"{
        A()
    }else if cmd == "B"{
        B()
    }else if cmd == "C"{
        C()
    }else{
        D()
    }
}

for i in 0..<4{
    for k in 0..<2{
        if arr[i][k]{
            print(i+1,k+1)
        }
    }
}