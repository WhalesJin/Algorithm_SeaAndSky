// 30%대에서 틀림
var n = Array(readLine()!).map { String($0) }
var array = [String]()
var answer = 0
var temp = 1
var isCorrect = true

for i in n.indices {
    if n[i] == "(" {
        temp *= 2
        array.append(String(i))
    } else if n[i] == "[" {
        temp *= 3
        array.append(String(i))
    } else if n[i] == ")" {
        if array.isEmpty || array.last != "(" {
            isCorrect = false
            break
        }

        if n[i - 1] == "(" {
            answer += temp
        }

        array.removeLast()
        temp /= 2
    } else if n[i] == "]" {
        if array.isEmpty || array.last != "[" {
            isCorrect = false
            break
        }

        if n[i - 1] == "[" {
            answer += temp
        }

        array.removeLast()
        temp /= 3
    }
}

print(!isCorrect || !array.isEmpty ? 0 : answer)



// 80%대에서 틀림 - 블로그 풀이
// 입력 받기
let string = readLine()!.map { String($0) }
var stack = [String]()

// 올바르지 않은 문자열인 경우 0 출력하고 프로그램 종료
func exitWithPrintingZero() {
    print(0)
    exit(0)
}

// 괄호들을 순회하면서
for s in string {
    //1. 여는 괄호의 경우 stack에 push
    if s == "(" || s == "[" {
        stack.append(s)
    //2. 닫는 소괄호의 경우
    } else if s == ")" {
        var temp = 0 // 계산 결과를 담아놓는 임시 변수
        guard !stack.isEmpty else { exitWithPrintingZero(); break }
            //👉 만약에 stack이 비었다면 여는 괄호와 짝을 이룰 수 없으므로 종료
        while !stack.isEmpty {
            let popped = stack.popLast()!
            //2-1. 여는 괄호를 만나면 지금까지의 계산 결과에 2를 곱해서 (단 0인 경우 2) push하고 break (짝을 찾음)
            if popped == "(" {
                stack.append(temp == 0 ? "2" : "\(2 * temp)")
                break
            //2-2. 짝이 맞지 않는 여는 괄호를 만나면 잘못된 짝이므로 종료
            } else if popped == "[" {
                exitWithPrintingZero()
            //2-3. 숫자를 만나면 덧셈 계산
            } else {
                temp += Int(popped)!
            }
        }
    //3. 닫는 대괄호의 경우
    } else if s == "]" {
        var temp = 0
        guard !stack.isEmpty else { exitWithPrintingZero(); break }
        while !stack.isEmpty {
            //3-1. 여는 괄호를 만나면 지금까지의 계산 결과에 3를 곱해서 (단 0인 경우 3) push하고 break (짝을 찾음)
            let popped = stack.popLast()!
            if popped == "[" {
                stack.append(temp == 0 ? "3" : "\(3 * temp)")
                break
            //3-2. 짝이 맞지 않는 여는 괄호를 만나면 잘못된 짝이므로 종료
            } else if popped == "(" {
                exitWithPrintingZero()
            //3-3. 숫자를 만나면 덧셈 계산
            } else {
                temp += Int(popped)!
            }
        }
    }
}

var ans = 0

// stack에 남은 숫자 더해서 답 구하기
for str in stack {
    guard let num = Int(str) else { exitWithPrintingZero(); break }
    ans += num
}

print(ans)


// 정답
let input = readLine()!.map(String.init)
var stack = [String]()
var isValid = input.count % 2 == 0

if isValid {
    loop: for word in input {
        switch word {
        case "(", "[":
            stack.append(word)
        default:
            var inner = 0
            let target = word == ")" ? "(" : "["
            let value = word == ")" ? 2 : 3

            while let last = stack.last,
            last != target {
                guard let number = Int(last) else {
                    isValid = false

                    break loop
                }

                inner += number
                stack.removeLast()
            }

            guard stack.last == target else {
                isValid = false

                break loop
            }

            stack.removeLast()
            stack.append(String(inner == 0 ? value : inner * value))
        }
    }
}

var result = 0

if isValid {
    for number in stack {
        guard let number = Int(number) else {
            result = 0
            break
        }

        result += number
    }
}

print(result)
