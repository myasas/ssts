/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configuration;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Turing
 */
public class ConfigurationMasterTest {
    
    public ConfigurationMasterTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of addConfigSettings method, of class ConfigurationMaster.
     */
    @Test
    public void testAddConfigSettings() {
        System.out.println("addConfigSettings");
        ConfigurationMaster instance = new ConfigurationMaster();
        JSONObject expResult = null;
        JSONObject result = instance.addConfigSettings();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of saveConfigFile method, of class ConfigurationMaster.
     */
    @Test
    public void testSaveConfigFile() {
        System.out.println("saveConfigFile");
        JSONObject jsonObj = null;
        ConfigurationMaster instance = new ConfigurationMaster();
        Boolean expResult = true;
        Boolean result = instance.saveConfigFile(jsonObj);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
    }

    /**
     * Test of readConfigFile method, of class ConfigurationMaster.
     */
    @Test
    public void testReadConfigFile() {
        System.out.println("readConfigFile");
        String configSetting = "";
        ConfigurationMaster instance = new ConfigurationMaster();
        JSONArray expResult = null;
        JSONArray result = instance.readConfigFile(configSetting);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of configsFromConfigFile method, of class ConfigurationMaster.
     */
    @Test
    public void testConfigsFromConfigFile() {
        System.out.println("configsFromConfigFile");
        ConfigurationMaster instance = new ConfigurationMaster();
        ConfigurationMaster expResult = null;
        ConfigurationMaster result = instance.configsFromConfigFile();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDbDriver method, of class ConfigurationMaster.
     */
    @Test
    public void testGetDbDriver() {
        System.out.println("getDbDriver");
        ConfigurationMaster instance = new ConfigurationMaster();
        String expResult = "";
        String result = instance.getDbDriver();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDbDriver method, of class ConfigurationMaster.
     */
    @Test
    public void testSetDbDriver() {
        System.out.println("setDbDriver");
        String dbDriver = "";
        ConfigurationMaster instance = new ConfigurationMaster();
        instance.setDbDriver(dbDriver);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDbConURL method, of class ConfigurationMaster.
     */
    @Test
    public void testGetDbConURL() {
        System.out.println("getDbConURL");
        ConfigurationMaster instance = new ConfigurationMaster();
        String expResult = "";
        String result = instance.getDbConURL();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDbConURL method, of class ConfigurationMaster.
     */
    @Test
    public void testSetDbConURL() {
        System.out.println("setDbConURL");
        String conURL = "";
        ConfigurationMaster instance = new ConfigurationMaster();
        instance.setDbConURL(conURL);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDbUserName method, of class ConfigurationMaster.
     */
    @Test
    public void testGetDbUserName() {
        System.out.println("getDbUserName");
        ConfigurationMaster instance = new ConfigurationMaster();
        String expResult = "";
        String result = instance.getDbUserName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDbUserName method, of class ConfigurationMaster.
     */
    @Test
    public void testSetDbUserName() {
        System.out.println("setDbUserName");
        String dbUserName = "";
        ConfigurationMaster instance = new ConfigurationMaster();
        instance.setDbUserName(dbUserName);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDbPassword method, of class ConfigurationMaster.
     */
    @Test
    public void testGetDbPassword() {
        System.out.println("getDbPassword");
        ConfigurationMaster instance = new ConfigurationMaster();
        String expResult = "";
        String result = instance.getDbPassword();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDbPassword method, of class ConfigurationMaster.
     */
    @Test
    public void testSetDbPassword() {
        System.out.println("setDbPassword");
        String dbPassword = "";
        ConfigurationMaster instance = new ConfigurationMaster();
        instance.setDbPassword(dbPassword);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getEmailUserName method, of class ConfigurationMaster.
     */
    @Test
    public void testGetEmailUserName() {
        System.out.println("getEmailUserName");
        ConfigurationMaster instance = new ConfigurationMaster();
        String expResult = "";
        String result = instance.getEmailUserName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setEmailUserName method, of class ConfigurationMaster.
     */
    @Test
    public void testSetEmailUserName() {
        System.out.println("setEmailUserName");
        String emailUserName = "";
        ConfigurationMaster instance = new ConfigurationMaster();
        instance.setEmailUserName(emailUserName);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getEmailPassword method, of class ConfigurationMaster.
     */
    @Test
    public void testGetEmailPassword() {
        System.out.println("getEmailPassword");
        ConfigurationMaster instance = new ConfigurationMaster();
        String expResult = "";
        String result = instance.getEmailPassword();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setEmailPassword method, of class ConfigurationMaster.
     */
    @Test
    public void testSetEmailPassword() {
        System.out.println("setEmailPassword");
        String emailPassword = "";
        ConfigurationMaster instance = new ConfigurationMaster();
        instance.setEmailPassword(emailPassword);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
