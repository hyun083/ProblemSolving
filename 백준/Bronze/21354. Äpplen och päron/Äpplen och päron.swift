let info = readLine()!.split(separator: " ").map{Int($0)!}
let A = info[0]*7
let P = info[1]*13
if A>P{
    print("Axel")
}else if A<P{
    print("Petra")
}else{
    print("lika")
}