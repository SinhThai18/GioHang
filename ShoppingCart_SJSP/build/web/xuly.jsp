<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="loi.jsp"%>
<%@page import="demo.com.spc.GioHang"%>
<%@page import="demo.com.db.XulyDB"%>
<%@page import="demo.com.db.SanPham"%>
<%@page import="demo.com.spc.MonHang"%>
<%
GioHang cart = (GioHang) session.getAttribute("gio");
if (request.getParameter("mua") != null) {
    String mssp = request.getParameter("ms");
    int soluong = Integer.parseInt(request.getParameter("sl"));
    if (cart == null)
        cart = new GioHang();
    XulyDB db = new XulyDB();
    SanPham sp = db.getSanPham(mssp);
    MonHang mh = new MonHang(sp.getMsSP(), soluong, sp.getDongia());
    cart.ThemHang(mh);
    session.setAttribute("gio", cart);
    response.sendRedirect("shopping.jsp");
} else if (request.getParameter("in") != null) {
    response.sendRedirect("hoadon.jsp");
}
%>
