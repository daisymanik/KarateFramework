package com.qa.driver;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.Assert.*;
import org.junit.Test;



@KarateOptions(features = "src/test/resources/features/CallingJavaProgram.feature",tags= "@negative")
public class TestRunParallel5 {
	
	
	@Test
    public void testParallel() {
        Results results = Runner.parallel(getClass(), 1, "target/surefire-reports");
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
	
}
