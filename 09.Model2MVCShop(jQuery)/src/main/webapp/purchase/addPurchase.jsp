<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>���� Ȯ�μ�</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>
</head>

<body>

	���� Ȯ�μ�

	<table border=1>
		<tr>
			<td>��ǰ ��ȣ</td>
			<td>${ purchase.purchaseProd.prodNo }</td>
			<td></td>
		</tr>
		<tr>
			<td>������ ID</td>
			<td>${ purchase.buyer.userId }</td>
			<td></td>
		</tr>
		<tr>
			<td>���� ���</td>
			<td> ${ purchase.paymentOption eq '1' ? '������ü' : '�ſ�ī��' }</td>
			<td></td>
		</tr>
		<tr>
			<td>������ �̸�</td>
			<td>${ purchase.buyer.userName }</td>
			<td></td>
		</tr>
		<tr>
			<td>������ ����ó</td>
			<td>${ purchase.receiverPhone }</td>
			<td></td>
		</tr>
		<tr>
			<td>������ �ּ�</td>
			<td>${ purchase.dlvyAddr }</td>
			<td></td>
		</tr>
		<tr>
			<td>���� ��û����</td>
			<td>${ purchase.dlvyRequest }</td>
			<td></td>
		</tr>
		<tr>
			<td>��� �������</td>
			<td>${ purchase.dlvyDate }</td>
			<td></td>
		</tr>
	</table>

</body>
</html>