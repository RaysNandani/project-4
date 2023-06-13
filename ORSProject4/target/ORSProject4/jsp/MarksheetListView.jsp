<%@page import="java.util.ArrayList"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.bean.StudentBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
<%@page import="in.co.rays.proj4.controller.MarksheetListCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marksheet List View</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script src="<%=ORSView.APP_CONTEXT%>/js/checkbox.js"></script>
</head>
<body>
	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.MarksheetBean"
		scope="request"></jsp:useBean>
	<%@include file="Header.jsp"%>
	<center>
		<h1>Marksheet List</h1>
		<tr>
			<h2>
				<td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
				<td colspan="8"><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></td>
			</h2>
		</tr>
		<form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="POST">
			<%
				List<StudentBean> studentlist = (List<StudentBean>) request.getAttribute("StudentList");
			%>
			<table width="100%">
				<tr>
					<td align="center"><label> Student Name :</label> <%=HTMLUtility.getList("sname", String.valueOf(bean.getId()), studentlist)%>
						&emsp; <label>RollNo :</label> <input type="text" name="rollNo"
						placeholder="Enter Roll No."
						value="<%=ServletUtility.getParameter("rollNo", request)%>">&emsp;
						&emsp; <label>Total :</label> <input type="number" name="Total"
						placeholder="Enter Total Number." value="">&emsp; <input
						type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_SEARCH%>"> &nbsp; <input
						type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<br>
			<table border="1" width="100%">
				<tr>
					<th><input type="checkbox" id="select_all" name="select">Select
						All</th>
					<th>S.No.</th>
					<th>RollNo</th>
					<th>Name</th>
					<th>Physics</th>
					<th>Chemistry</th>
					<th>Maths</th>
					<th>Total</th>
					<th>Percentage</th>
					<th>Result</th>
					<th>Edit</th>
				</tr>

				<%
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;
					String totalA = request.getParameter("Total");
					int totalReq = Integer.parseInt((totalA == null || totalA == "") ? "0" : totalA);

					List<MarksheetBean> list = new ArrayList();
					if (totalReq > 0) {
						List<MarksheetBean> listA = ServletUtility.getList(request);
						Iterator it1 = listA.iterator();
						while (it1.hasNext()) {
							bean = (MarksheetBean) it1.next();
							if (totalReq == bean.getPhysics() + bean.getChemistry() + bean.getMaths()) {
								list.add(bean);
							}

						}

					} else {
						list = ServletUtility.getList(request);
						ServletUtility.getErrorMessage("No record found ", request);

					}

					Iterator<MarksheetBean> it = list.iterator();
					while (it.hasNext()) {
						bean = it.next();
				%>
				<tr align="center">
					<td><input type="checkbox" class="checkbox" name="ids"
						value="<%=bean.getId()%>"></td>
					<td><%=index++%></td>
					<td><%=bean.getRollNo()%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getPhysics()%></td>
					<td><%=bean.getChemistry()%></td>
					<td><%=bean.getMaths()%></td>
					<td><%=(bean.getMaths() + bean.getChemistry() + bean.getPhysics())%></td>
					<td><%=((bean.getMaths() + bean.getChemistry() + bean.getPhysics()) / 3) + " %"%></td>
					<%
						if (bean.getMaths() > 33 && bean.getChemistry() > 33 && bean.getPhysics() > 33) {
					%>
					<td><font color="green">Pass</font></td>
					<%
						} else {
					%>
					<td><font color="red">Fail</font></td>
					<%
						}
					%>

					<td><a href="MarksheetCtl?id=<%=bean.getId()%>">Edit</a></td>
				</tr>

				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<%
						if (pageNo == 1) {
					%>
					<td><input type="submit" name="operation" disabled="disabled"
						value="<%=MarksheetListCtl.OP_PREVIOUS%>"></td>
					<%
						} else {
					%>
					<td><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_PREVIOUS%>"></td>
					<%
						}
					%>
					<td><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_DELETE%>"></td>
					<td align="right"><input type="submit" name="operation"
						value="<%=MarksheetListCtl.OP_NEXT%>"
						<%=(list.size() < pageSize) ? "disabled" : ""%>></td>
				</tr>

			</table>
			<%
				if (list.size() == 0) {
			%>
			<td align="center"><input type="submit" name="operation"
				value="<%=MarksheetListCtl.OP_BACK%>"></td>
			<%
				}
			%>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>
	</center>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="Footer.jsp"%>
</body>
</html>