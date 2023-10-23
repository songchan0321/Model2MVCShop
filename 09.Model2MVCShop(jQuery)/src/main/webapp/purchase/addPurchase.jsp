<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>구매 확인서</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>
</head>

<body>

	구매 확인서

	<table border=1>
		<tr>
			<td>물품 번호</td>
			<td>${ purchase.purchaseProd.prodNo }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매자 ID</td>
			<td>${ purchase.buyer.userId }</td>
			<td></td>
		</tr>
		<tr>
			<td>결제 방식</td>
			<td> ${ purchase.paymentOption eq '1' ? '계좌이체' : '신용카드' }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매자 이름</td>
			<td>${ purchase.buyer.userName }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매자 연락처</td>
			<td>${ purchase.receiverPhone }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매자 주소</td>
			<td>${ purchase.dlvyAddr }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매 요청사항</td>
			<td>${ purchase.dlvyRequest }</td>
			<td></td>
		</tr>
		<tr>
			<td>배송 희망일자</td>
			<td>${ purchase.dlvyDate }</td>
			<td></td>
		</tr>
	</table>

</body>
</html>