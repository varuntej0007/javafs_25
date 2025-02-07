<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Calculator</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f1f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .calculator {
            width: 300px;
            padding: 20px;
            border-radius: 15px;
            background-color: #fff;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        }
        .calculator h2 {
            text-align: center;
            color: #333;
        }
        .display {
            width: 100%;
            height: 50px;
            background-color: #f4f4f4;
            text-align: right;
            padding: 10px;
            font-size: 1.5em;
            border: none;
            margin-bottom: 15px;
            border-radius: 10px;
            box-shadow: inset 0px 0px 5px rgba(0, 0, 0, 0.1);
        }
        .btn {
            width: 60px;
            height: 60px;
            margin: 5px;
            background-color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 1.2em;
            color: #333;
            cursor: pointer;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #f8c1d8;
        }
        .btn-operation {
            background-color: #ff8fb1;
            color: #fff;
        }
        .btn-equal {
            background-color: #ff527b;
            color: #fff;
        }
        .btn-clear {
            background-color: #ffb6c1;
            color: #fff;
        }
        .calculator-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-gap: 10px;
        }
    </style>
</head>
<body>
    <div class="calculator">
        <h2>Calculator</h2>
        <form action="CalculatorServlet" method="post">
            <input type="text" id="display" name="display" class="display" readonly>
            <div class="buttons">
                <button type="button" class="btn" onclick="addToDisplay('7')">7</button>
                <button type="button" class="btn" onclick="addToDisplay('8')">8</button>
                <button type="button" class="btn" onclick="addToDisplay('9')">9</button>
                <button type="button" class="btn btn-operation" onclick="addToDisplay('+')">+</button>

                <button type="button" class="btn" onclick="addToDisplay('4')">4</button>
                <button type="button" class="btn" onclick="addToDisplay('5')">5</button>
                <button type="button" class="btn" onclick="addToDisplay('6')">6</button>
                <button type="button" class="btn btn-operation" onclick="addToDisplay('-')">-</button>

                <button type="button" class="btn" onclick="addToDisplay('1')">1</button>
                <button type="button" class="btn" onclick="addToDisplay('2')">2</button>
                <button type="button" class="btn" onclick="addToDisplay('3')">3</button>
                <button type="button" class="btn btn-operation" onclick="addToDisplay('*')">*</button>

                <button type="button" class="btn btn-clear" onclick="clearDisplay()">C</button>
                <button type="button" class="btn" onclick="addToDisplay('0')">0</button>
                <button type="submit" class="btn btn-equal">=</button>
                <button type="button" class="btn btn-operation" onclick="addToDisplay('/')">/</button>
            </div>
        </form>

        <h3>Result: ${result}</h3>
    </div>

    <script>
    document.addEventListener('keydown', function(event) {
        const key = event.key;

        if (!isNaN(key)) {
            addToDisplay(key);
        } else if (key === '+' || key === '-' || key === '*' || key === '/') {
            addToDisplay(key);
        } else if (key === 'Enter') {
            document.querySelector('form').submit();
        } else if (key === 'Escape' || key === 'c') {
            clearDisplay();
        }
    });

    function addToDisplay(value) {
        document.getElementById('display').value += value;
    }

    function clearDisplay() {
        document.getElementById('display').value = '';
    }
</script>

</body>
</html>
