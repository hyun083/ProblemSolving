let ABC = readLine()!.split(separator: " ").map{UInt64(String($0))!}
let A = ABC[0]
let B = ABC[1]
let C = ABC[2]

if B >= C{
    print("-1")
}else{
    print((A/(C-B))+1)
}