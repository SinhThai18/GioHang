<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" errorPage="loi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="demo.com.spc.GioHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="demo.com.spc.MonHang"%>
<%@page import="demo.com.db.SanPham"%>
<%@page import="demo.com.db.XulyDB"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin giỏ hàng</title>
    </head>
    <body>
        <table border="1" width="70%">
            <tr>
                <th>MSSP</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
            </tr>
            <% 
                GioHang cart = (GioHang)session.getAttribute("gio");
                if(cart != null) {
                    XulyDB db = new XulyDB();
                    ArrayList<MonHang> ds = cart.getGH();
                    for(MonHang mh : ds) {
                        SanPham sp = db.getSanPham(mh.getMsMH());
            %>
            <tr>
                <td><%= mh.getMsMH() %></td>
                <td><%= sp.getTenSP() %></td>
                <td><%= mh.getSoluong() %></td>
                <td><%= mh.getDongia() %></td>
            </tr>
            <%
                    }
            %>
        </table>
        <h2 align="right">Tổng tiền: <%= cart.Tongtien() %></h2>
        <% } %>
    </body>
</html>
