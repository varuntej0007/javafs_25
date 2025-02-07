<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculator</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #1e1e1e;
            color: white;
        }
        .calculator {
            background: #333;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            width: 250px;
            text-align: center;
        }
        .display {
            width: 100%;
            height: 50px;
            font-size: 24px;
            text-align: right;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #555;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .buttons {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }
        button {
            width: 100%;
            height: 50px;
            font-size: 18px;
            background-color: #444;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #666;
        }
        .equals {
            background-color: #28a745;
        }
        .equals:hover {
            background-color: #218838;
        }
        .clear {
            background-color: #dc3545;
        }
        .clear:hover {
            background-color: #c82333;
        }
    </style>
    <script>
        function appendToDisplay(value) {
            document.getElementById('display').value += value;
        }
        function clearDisplay() {
            document.getElementById('display').value = '';
        }
    </script>
</head>
<body>
    <div class="calculator">
        <form action="CalculatorServlet" method="post">
            <input type="text" id="display" name="display" class="display" readonly value="<%= request.getAttribute(\"result\") != null ? request.getAttribute(\"result\") : \"\" %>">
            <div class="buttons">
                <button type="button" onclick="appendToDisplay('1')">1</button>
                <button type="button" onclick="appendToDisplay('2')">2</button>
                <button type="button" onclick="appendToDisplay('3')">3</button>
                <button type="button" onclick="appendToDisplay('/')">/</button>
                <button type="button" onclick="appendToDisplay('4')">4</button>
                <button type="button" onclick="appendToDisplay('5')">5</button>
                <button type="button" onclick="appendToDisplay('6')">6</button>
                <button type="button" onclick="appendToDisplay('*')">*</button>
                <button type="button" onclick="appendToDisplay('7')">7</button>
                <button type="button" onclick="appendToDisplay('8')">8</button>
                <button type="button" onclick="appendToDisplay('9')">9</button>
                <button type="button" onclick="appendToDisplay('-')">-</button>
                <button type="button" class="clear" onclick="clearDisplay()">CE</button>
                <button type="button" onclick="appendToDisplay('0')">0</button>
                <button type="submit" class="equals">=</button>
                <button type="button" onclick="appendToDisplay('+')">+</button>
            </div>
        </form>
    </div>
</body>
</html>
