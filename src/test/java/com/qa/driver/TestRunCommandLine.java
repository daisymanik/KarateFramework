package com.qa.driver;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit4.Karate;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(Karate.class)

@KarateOptions(features = "src/test/resources/features/CallingJavaProgram.feature")
public class TestRunCommandLine {
	
	
}
