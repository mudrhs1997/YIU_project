import Foundation

/*
111111
000001
101011
111000
111011
111111
 */

var ipt = readLine()!.components(separatedBy: " ").map { Int($0)! }
var result = ""
let x = [0,1,0,-1]
let y = [1,0,-1,0]
var arr = Array(repeating: [], count: ipt[0])
var visited = Array(repeating: Array(repeating: false, count: ipt[1]), count: ipt[0])
var stack = [(Int, Int)]()


for i in 0..<arr.count {
    var input = readLine()!
    result += "\(input)\n"
    let cnt = input.count
    for j in 0..<cnt {
        var char = input.removeFirst()
        if char == "1" {
            visited[i][j] = true
        }
        arr[i].append(String(char))
    }
}
var str = readLine()!.components(separatedBy: " ").map{Int($0)!}
var end = readLine()!.components(separatedBy: " ").map{Int($0)!}
let exit = (end[0],end[1])

func dfs(_ start: (Int, Int)) {
    visited[start.0][start.1] = true
    arr[start.0][start.1] = "a"
    for i in 0..<4 {
        let point_x = start.0+x[i]
        let point_y = start.1+y[i]
        if 0 <= point_x && point_x < ipt[0] && 0 <= point_y && point_y < ipt[1] {
            if visited[point_x][point_y] == false {
                stack.append((point_x,point_y))
            }
        }
    }
    print("Stack : \(stack)")
    if start == exit {
        for i in arr {
            print(i)
        }
        print("arrive!")
    } else if !stack.isEmpty {
        var next = stack.removeLast()
        for i in arr {
            print(i)
        }
        dfs(next)
    }
}

dfs((str[0],str[1]))




