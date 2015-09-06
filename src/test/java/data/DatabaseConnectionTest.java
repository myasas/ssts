/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class DatabaseConnectionTest {
    
    public DatabaseConnectionTest() {
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
     * Test of getInstance method, of class DatabaseConnection.
     */
    @Test
    public void testGetInstance() {
        System.out.println("getInstance");
        DatabaseConnection expResult = null;
        DatabaseConnection result = DatabaseConnection.getInstance();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insertValues method, of class DatabaseConnection.
     */
    @Test
    public void testInsertValues() throws Exception {
        System.out.println("insertValues");
        String SQL = "";
        DatabaseConnection instance = null;
        instance.insertValues(SQL);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getValues method, of class DatabaseConnection.
     */
    @Test
    public void testGetValues() throws Exception {
        System.out.println("getValues");
        String SQL = "";
        DatabaseConnection instance = null;
        ResultSet expResult = null;
        ResultSet result = instance.getValues(SQL);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateValues method, of class DatabaseConnection.
     */
    @Test
    public void testUpdateValues() throws Exception {
        System.out.println("updateValues");
        String SQL = "";
        DatabaseConnection instance = null;
        instance.updateValues(SQL);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPst method, of class DatabaseConnection.
     */
    @Test
    public void testGetPst() throws Exception {
        System.out.println("getPst");
        String SQL = "";
        DatabaseConnection instance = null;
        PreparedStatement expResult = null;
        PreparedStatement result = instance.getPst(SQL);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSt method, of class DatabaseConnection.
     */
    @Test
    public void testGetSt() throws Exception {
        System.out.println("getSt");
        DatabaseConnection instance = null;
        Statement expResult = null;
        Statement result = instance.getSt();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
