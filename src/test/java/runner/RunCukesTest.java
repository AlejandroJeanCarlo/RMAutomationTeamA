package runner;

import Framework.DriverManager;
import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;
import org.apache.log4j.Logger;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;

@CucumberOptions(
        plugin = {"pretty", "html:target/cucumber", "json:target/cucumber.json"},
        glue={"steps"},
        features = {"src/test/resources/features"},
        monochrome = true)
public class RunCukesTest  extends AbstractTestNGCucumberTests {
    final static Logger logger = Logger.getLogger(RunCukesTest.class);
    @BeforeTest
    public void beforeTest()
    {
        logger.info("Test Start!!!!!");
        System.out.println("Before all the execution");
    }

    @AfterTest
    public void afterExecution() {

        try {
            DriverManager.getInstance().quit();
        } catch (Exception e) {
            logger.error("Unable to quit the driver", e);
        }
        logger.info("End test!!!!!");

    }
}
