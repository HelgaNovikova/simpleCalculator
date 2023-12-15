package app;

import java.math.BigDecimal;

public class Calculator {

    private BigDecimal firstNumber;
    private BigDecimal secondNumber;

    public String performCalculations(String firstNumber, String secondNumber, String operation) {
        if (!areNumbersValid(firstNumber, secondNumber)) {
            return "Error: Incorrect number format";
        }
        if (!isOperationTypeValid(operation)) {
            return "Error: Incorrect operation type";
        }
        if (operation.trim().equals("*")) {
            return multiply(this.firstNumber, this.secondNumber).toString();
        } else return add(this.firstNumber, this.secondNumber).toString();
    }

    private boolean areNumbersValid(String firstNumber, String secondNumber) {
        try {
            this.firstNumber = parseStringToNumber(firstNumber);
            this.secondNumber = parseStringToNumber(secondNumber);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private boolean isOperationTypeValid(String operation) {
        return operation.trim().length() == 1;
    }

    private BigDecimal parseStringToNumber(String number) {
        return new BigDecimal(number.trim().replace(",", "."));
    }

    private BigDecimal add(BigDecimal firstNumber, BigDecimal secondNumber) {
        return firstNumber.add(secondNumber);
    }

    private BigDecimal multiply(BigDecimal firstNumber, BigDecimal secondNumber) {
        return firstNumber.multiply(secondNumber);
    }

}
