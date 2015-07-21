
import junit.framework.TestCase;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;

import com.eshop.service.AdminService;


public abstract class AbstractSpringTest extends TestCase { 

	@SuppressWarnings("unused")  
    private final Logger log = Logger.getLogger(AbstractSpringTest.class.getName());  
      
    @Autowired  
    protected AdminService adminService;  
      
    protected String deploymentId;  
      
    public AbstractSpringTest() {  
        super();  
    }  
      
    @Before  
    public void initialize() throws Exception {  
        beforeTest();  
    }  
      
    @After  
    public void clean() throws Exception {  
        afterTest();  
    }  
      
    protected abstract void beforeTest() throws Exception;  
      
    protected abstract void afterTest() throws Exception; 

}
