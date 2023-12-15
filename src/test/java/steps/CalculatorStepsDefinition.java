package steps;

import app.Calculator;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.jupiter.api.Assertions;

import java.math.BigDecimal;

public class CalculatorStepsDefinition {

    private Calculator calculator;
    private String firstNumber;
    private String secondNumber;
    private String operationType;

    @Given("calculator is up")
    public void runCalculator() {
        calculator = new Calculator();
    }

    @When("user enters {string} as a first number")
    public void setFirstNumber(String number) {
        this.firstNumber = number;
    }

    @When("user enters {string} as a second number")
    public void setSecondNumber(String number) {
        this.secondNumber = number;
    }

    @When("user enters {string} as an operation type")
    public void setOperationType(String operationType) {
        this.operationType = operationType;
    }

    @Then("they receive {string} as the result")
    public void compareActualAndExpectedResults(String expectedResult) {
        String actualResult = calculator.performCalculations(this.firstNumber, this.secondNumber, this.operationType);
        if (actualResult.toLowerCase().contains("error")) {
            Assertions.assertEquals(actualResult, expectedResult);
        } else
            Assertions.assertEquals(new BigDecimal(expectedResult), new BigDecimal(actualResult));
    }

}
