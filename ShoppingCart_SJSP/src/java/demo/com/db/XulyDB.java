/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.com.db;

/**
 *
 * @author thaim
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class XulyDB {

    private Connection con;

    public XulyDB() {
        try {
            con = ConnectDBFactory.CreateSqlConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public SanPham getSanPham(String ms) {
        SanPham sp = null;
        try {
            Statement stmt = con.createStatement();
            String sql = "select * from sanpham where mssp='" + ms + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                String mssp = rs.getString("mssp");
                String ten = rs.getString("tenSP");
                double dg = rs.getDouble("dongia");
                sp = new SanPham(mssp, ten, dg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sp;
    }

    public ResultSet getAllProducts() {
        ResultSet rs = null;
        try {
            Statement stmt = con.createStatement();
            String sql = "select * from sanpham";
            rs = stmt.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
}
