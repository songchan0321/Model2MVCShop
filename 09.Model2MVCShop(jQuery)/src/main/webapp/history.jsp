<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>

<title>ȯ���մϴ�!!</title>

</head>
<body>

���θ��� ���� �������� �������� ȯ���մϴ�! <br><br>

���� ���θ��� �������� ��Ȱ�� ���� ǳ��Ӱ� ����� �帮�� ���� ����ϰ� �ֽ��ϴ�.<br><br>

������ �ܼ��� ��ǰ�� �����ϴ� �� �̻��� �ǹ̸� �����ϴ�.<br><br>

�װ��� �������� ����� ��Ÿ���� ǥ���ϰ�, ���� ǰ���� ����Ű�� ������ �����Դϴ�.<br><br>

����, �츮�� �ֻ��� ��ǰ�� ���񽺸� �����Ͽ� �������� ������ Ư���ϰ� ������� �մϴ�.<br><br>

�츮 ���θ��� �پ��� ī�װ��� ��ǰ�� �����ϸ�, �ֽ� Ʈ���带 �ݿ��ϰ� �پ��� ���ݴ��� ��ǰ�� �����ϰ� �ֽ��ϴ�.<br><br>

����, ���� �˻� �� ���͸� ������ ���� �������� ������ ���� ��̰� ����� �帱 ���Դϴ�.<br><br>

�������� �ֿ켱���� �����ϸ�, �� ���� ���񽺸� �����ϱ� ���� �׻� ����ϰ� �ֽ��ϴ�.<br><br>

�������� �ǰ߰� �ǵ���� ���񿡰� ū ��ġ�� ������, �׻� ��� �ݿ��ϰ��� �մϴ�.<br><br>

����� �Բ��ϴ� ��� ������ Ư���ϰ� ��ſ� ������ �Ǳ⸦ ����մϴ�.<br><br>

�������� ���� ���θ��� �湮�Ͽ� �Ǹ��� ��ǰ�� ���񽺸� ����������.<br><br>

�������� ���� �׻� �ּ��� ���ϰڽ��ϴ�.<br><br>

�ٽ� �� ��, ȯ���մϴ�!<br><br>

�����մϴ�.

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