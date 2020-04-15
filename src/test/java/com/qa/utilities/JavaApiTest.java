package com.qa.utilities;

import static org.junit.Assert.assertEquals;
import java.util.HashMap;
import java.util.Map;
import org.junit.BeforeClass;
import org.junit.Test;
import com.intuit.karate.Runner;

public class JavaApiTest {
	@BeforeClass

    public static void beforeClass() {
        // skip 'callSingle' in karate-config.js
        System.setProperty("karate.env", "mock"); 
    }    

    @Test
    public void testCallingFeatureFromJava() {
        Map<String, Object> args = new HashMap();
        args.put("name", "World");
        Map<String, Object> result = Runner.runFeature(getClass(), "file:D:\\KarateFramework\\src\\test\\resources\\features\\TagsGrouping.feature", args, true);
        assertEquals("Hello World", result.get("greeting"));
    }
       //@Test
    public void testCallingClasspathFeatureFromJava() {
        Map<String, Object> args = new HashMap();
        args.put("name", "World");
        Map<String, Object> result = Runner.runFeature("D:\\KarateFramework-master\\src\\test\\resources\\features\\features", args, true);
        assertEquals("Hello World", result.get("greeting"));

       }    

}

