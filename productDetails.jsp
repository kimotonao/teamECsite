<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./css/header_h1.css">
	<link rel="stylesheet" href="./css/button.css">
	<link rel="stylesheet" href="./css/pumpkinimg.css">
	<link rel="stylesheet" href="./css/tableform.css">
	<link rel="stylesheet" href="./css/commonMessage.css">
	<title>商品詳細</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="contents">
		<h1>商品詳細画面</h1>
		<s:if test="productInfoDTO != null">
			<s:form action="AddCartAction">
				<div class ="box">
					<div class="column-container">
						<div class="left">
							<img src='<s:property value="productInfoDTO.imageFilePath"/>/<s:property value="productInfoDTO.imageFileName"/>' class="img"/><br>
						</div>
						<div class="right">
							<table class="vertical-list-table-mini">
								<tr>
									<th scope="row"><s:label value="商品名"/></th>
									<td><s:property value="productInfoDTO.productName"/></td>
								</tr>
								<tr>
									<th scope="row"><s:label value="商品名ふりがな"/></th>
									<td><s:property value="productInfoDTO.productNameKana"/></td>
								</tr>
								<tr>
									<th scope="row"><s:label value="値段"/></th>
									<td><s:property value="productInfoDTO.price"/>円</td>
								</tr>
								<tr>
									<th scope="row"><s:label value="購入個数"/></th>
									<td><s:select name="productCount" list="%{productCountList}"/>個</td>
								</tr>
								<tr>
									<th scope="row"><s:label value="発売会社名"/></th>
									<td><s:property value="productInfoDTO.releaseCompany"/></td>
								</tr>
								<tr>
									<th scope="row"><s:label value="発売年月日"/></th>
									<td><s:property value="productInfoDTO.releaseDate"/></td>
								</tr>
								<tr>
									<th scope="row"><s:label value="商品詳細情報"/></th>
									<td><s:property value="productInfoDTO.productDescription"/></td>
								</tr>
							</table>
						</div>
					</div>
					<s:hidden name="productId" value="%{productInfoDTO.productId}"/>
				</div>
				<div class="btn_position">
					<s:submit value="カートに追加" class="btn"/>
				</div>
			</s:form>
			<s:if test="relatedProductList !=null && relatedProductList.size()>0">
				<div class="box">
				<h2>【関連商品】</h2>
					<div class="product-details-recommend-box">

					<s:iterator value="relatedProductList">
						<div class="recommend-box">
						<a href='<s:url action="ProductDetailsAction">
							<s:param name="productId" value="%{productId}"/>
							</s:url>'><img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' class="img"/>
							<s:property value="productName"/><br>
						</a></div>
					</s:iterator>
					</div>
				</div>
			</s:if>
		</s:if>
		<s:else>
			<div class="info">
				<span>商品の詳細情報がありません。</span>
			</div>
		</s:else>
	</div>
</body>
</html>