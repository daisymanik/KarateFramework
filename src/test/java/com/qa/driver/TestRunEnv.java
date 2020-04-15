package com.qa.driver;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit4.Karate;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;


@KarateOptions(features = "src/test/resources/features/karateconfig.feature")

public class TestRunEnv {

	@BeforeClass
	public static void before() {
		System.setProperty("karate.env", "stage");
	}

	@Test
	public void testParallel() {
		Results results = Runner.parallel(getClass(), 1, "target/surefire-reports");
		assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
	}

}
