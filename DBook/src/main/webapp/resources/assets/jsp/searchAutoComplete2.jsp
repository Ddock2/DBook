<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
$(function(){ $( "#autocompleteText" ).autocomplete({ source : function( request, response ) { //���� ����? jquery Ajax�� �񵿱� ����� �� //json��ü�� �������� �����޾Ƽ� ����Ʈ �̴� �۾�
		$.ajax({ //ȣ���� URL 
			url: "search.jsp", //�켱 jsontype json���� 
			dataType: "json", // parameter ���̴�. �������� �ټ��� �ִ�. 
			data: { //request.term >> �̰� ��ü�� text�ڽ����� �Էµ� ���̴�. 
				searchValue: request.term }, 
				success: function( result ) { //return �ȳ��� response() �Լ����� ������ ���� �����ؼ� �̾ƿ´�. 
					response( $.map( result, function( item ) { return { //label : ȭ�鿡 �������� �ؽ�Ʈ //value : ���� text�±׿� �� �� //������ �Ѵ� �Ȱ��� ���� //ȭ�鿡 �������� text�� ��, value�� �Ǳ⶧�� 
						label: item.data, 
						value: item.data 
						} 
					}) 
				); 
			} 
		}); 
			}, 
			//�ּ� ���� �̻�Ǹ� ����� �����ϰڴٶ�� �ɼ�
				minLength: 2,
				//�ڵ��ϼ� ��Ͽ��� Ư�� �� ���ý� ó���ϴ� ���� ���� 
				//���������� �ܼ� text�±׳��� ���� ����. 
				select: function( event, ui ) {} 
		}); 
})


</script>
</head>
<body>

</body>
</html>