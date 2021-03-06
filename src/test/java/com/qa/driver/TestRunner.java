package com.qa.driver;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import static org.junit.Assert.*;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.junit.Test;



@KarateOptions(features = "src/test/resources/features/TagsGrouping.feature",tags= "@negative")

public class TestRunner {
    
	String Status;
	String ResultDesc;
	
    @Test
    public void testParallel() {
    	
    	String outputPath = "target\\surefire-reports";
        Results results = Runner.parallel(getClass(), 5, "target/surefire-reports");
        generateReport(outputPath);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
        
    }
      
    private static void generateReport(String outputPath) {
    	Collection<File> jsonFiles = FileUtils.listFiles(new File(outputPath), new String[] {"json"}, true);
    	List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
    	jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    	//	jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    	Configuration config = new Configuration(new File("target"), "Karate with Junit5 Report");
    	ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
    	reportBuilder.generateReports();
    	
    }
    
}