import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@CucumberOptions(features = {"src/test/resources"}, glue = "steps")
@RunWith(Cucumber.class)
public class TestRunner {
}
