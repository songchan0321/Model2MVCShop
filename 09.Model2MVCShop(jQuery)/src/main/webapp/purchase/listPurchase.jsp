<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>구매 목록 조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetPurchaseList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/purchase/listPurchase" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">구매 목록 조회</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 ${ resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">구매 목록</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">회원 ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">구매 상품 번호</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">전화번호</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">배송 현황</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">물품 수령 확인</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				
				<c:if test="${resultPage.totalCount == 0 }">
					<tr class="ct_list_pop"> 
						<td align="center" colspan="100%">
							구매 내역이 없습니다.
						</td>
					</tr>
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:if>
				<c:if test="${resultPage.totalCount > 0 }">
					<c:set var="i" value="0"/>
					<c:forEach var="purchase" items="${ list }">
						<tr class="ct_list_pop"> 
							<c:set var="i" value="${ i+1 }"/>
							<td align="center">
								<a href="/purchase/getPurchase?tranNo=${purchase.tranNo }">${i } (구매 정보)</a>
							</td>
							<td></td>
							<td align="left">
								<a href="/user/getUser?userId=${ user.userId }">${ user.userId }</a>
							</td>
							<td></td>
							<td align="left">
								<a href="/product/getProduct?prodNo=${ purchase.purchaseProd.prodNo }&menu=search">${ purchase.purchaseProd.prodNo } (물품 정보 조회)</a></td>
							<td></td>
							<td align="left">
								${ purchase.receiverPhone }</td>
							<td></td>
							<td align="left">
								<c:choose>
									<c:when test="${ purchase.tranCode eq '1' }">
										구매해 주셔서 감사합니다 !!  신속히 배송해 드리겠습니다 !!  ////  배송 준비중
									</c:when>
									<c:when test="${ purchase.tranCode eq '2' }">
										기사님이 물품을 열심히 배송중 입니다 !!   //// 배송중
									</c:when>
									<c:when test="${ purchase.tranCode eq '3' }">
										물품 수령이 완료 되었습니다 !! 저희 샵을 이용해 주셔서 감사합니다 !!
									</c:when>
								</c:choose>
							</td>
							<td></td>
							<td align="left">
								<c:if test="${ purchase.tranCode eq '2' }">
									<a href="/purchase/updateTranCodeByProd?prodNo=${purchase.purchaseProd.prodNo}&tranCode=3&currentPage=${resultPage.currentPage}">물품 수령 완료!</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="11" bgcolor="D6D7D6" height="1"></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<!--페이지 이동 처리  -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
					<input type="hidden" id="currentPage" name="currentPage" value="" /> 
					<jsp:include page="../common/pageNavigator3.jsp"/>
					</td>
				</tr>
			</table>
		</form>

	</div>

</body>
</html>