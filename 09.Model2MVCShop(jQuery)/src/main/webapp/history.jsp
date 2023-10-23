<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>

<title>환영합니다!!</title>

</head>
<body>

쇼핑몰에 오신 여러분을 진심으로 환영합니다! <br><br>

저희 쇼핑몰은 여러분의 생활을 더욱 풍요롭게 만들어 드리기 위해 노력하고 있습니다.<br><br>

쇼핑은 단순히 상품을 구매하는 것 이상의 의미를 가집니다.<br><br>

그것은 여러분의 취향과 스타일을 표현하고, 삶의 품질을 향상시키는 일종의 예술입니다.<br><br>

따라서, 우리는 최상의 제품과 서비스를 제공하여 여러분의 쇼핑을 특별하게 만들고자 합니다.<br><br>

우리 쇼핑몰은 다양한 카테고리의 상품을 제공하며, 최신 트렌드를 반영하고 다양한 가격대의 제품을 보유하고 있습니다.<br><br>

또한, 편리한 검색 및 필터링 도구를 통해 여러분의 쇼핑을 더욱 즐겁게 만들어 드릴 것입니다.<br><br>

고객만족을 최우선으로 생각하며, 더 나은 서비스를 제공하기 위해 항상 노력하고 있습니다.<br><br>

여러분의 의견과 피드백은 저희에게 큰 가치가 있으며, 항상 듣고 반영하고자 합니다.<br><br>

저희와 함께하는 모든 순간이 특별하고 즐거운 경험이 되기를 기대합니다.<br><br>

언제든지 저희 쇼핑몰을 방문하여 훌륭한 제품과 서비스를 만나보세요.<br><br>

여러분을 위해 항상 최선을 다하겠습니다.<br><br>

다시 한 번, 환영합니다!<br><br>

감사합니다.

<br>
<br>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String history = null;
	Cookie[] cookies = request.getCookies();
	if (cookies!=null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("history")) {
				history = cookie.getValue();
			}
		}
		if (history != null) {
			String[] h = history.split(",");
			for (int i = 0; i < h.length; i++) {
				if (!h[i].equals("null")) {
%>
<a href="/product/getProduct?prodNo=<%=h[i]%>&menu=search"
	target="rightFrame"><%=h[i]%></a>
<br>
<%
				}
			}
		}
	}
%>

</body>
</html>