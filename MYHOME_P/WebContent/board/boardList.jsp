<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/templates/header.jsp">
	<jsp:param value="Board List" name="title" />
</jsp:include>

	<script>
	
		// 검색 결과 목록 보기
		function fn_queryBoardList(f) {
			f.action = '/MYHOME_P/queryBoardList.board';
			f.submit();
		}
		// 내 게시글 목록 보기
		function fn_myBoardList(f) {
			f.action = '/MYHOME_P/myBoardList.board';
			f.submit();
		}
		// 새 게시글 등록
		function fn_boardInsertPage(f) {
			f.action = '/MYHOME_P/boardInsertPage.board';
			f.submit();
		}
		// 전체 게시글 목록 보기
		function fn_boardList(f) {
			f.action = '/MYHOME_P/boardList.board';
			f.submit();
		}
	</script>
<!-- html -->
<br/><br/>

	
	<br/><br/>
	<div class="poolList">
	Total: &nbsp;  ${totalRecord} posts <br/>
	</div>
	<hr>
	<!-- 게시판 검색 -->

	<div class="search">
	<form>
	<select name="column" id="searchSelect">
		<option value="BTITLE">Title</option>
		<option value="BCONTENT">Content</option>
		<option value="BOTH">Title+Content</option>
	</select>
		<input type="text" name="query" />
		<input type="button" value="Search" onclick="fn_queryBoardList(this.form)" />
	</form>
	</div>
	<br/><br/>
		
	<table>
		<thead>
			<tr>
				<th>title</th>
				<th>writer</th>
				<th>date</th>
				<th>views</th>
			</tr>
		</thead>
<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="4">There is no post yet.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="bDto" items="${list}">
					<tr>
						<td>
						
							<!-- 1. 댓글은 bDepth 만큼 들여쓰기를 한다. -->
							<c:forEach begin="1" end="${bDto.bDepth}" step="1">
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
							
							<!-- 2. 댓글은 제목 앞에 ㄴRe. 를 표시한다. -->
							<c:if test="${bDto.bDepth ne 0}">
								ㄴRe.
							</c:if>
						
							<!-- 3. 삭제된 게시글은 링크를 제공하지 않는다. -->
							<c:if test="${bDto.bDelete eq 0}">
								<a href="/MYHOME_P/boardView.board?bNo=${bDto.bNo}&page=${page}">${bDto.bTitle}</a>							
							</c:if>
							<c:if test="${bDto.bDelete eq -1}">
								${bDto.bTitle}(This post has been deleted.)
							</c:if>
							
							
						</td>
						<td>${bDto.mId}</td>
						<td>${bDto.bRegDate}</td>
						<td>${bDto.bHit}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		</table>
		<br/><br/><br/>
		<div class="page">
			<tr>
				<td colspan="4" style='margin: auto;'>${paging}</td>
			</tr>
		</div>
	
	<br/>
	<div class="newPost">
	<form>	
		<!-- 게시판 작성 버튼 : 로그인해야 작성할 수 있다. -->
		<input type="hidden" name="page" value="${page}" />
		<!--  <input type="button" value="List" onclick="fn_boardList(this.form)" />-->
		<c:if test="${loginUser ne null}">
			<button type="button" class="btn btn-outline-warning" onclick="fn_boardInsertPage(this.form)" >NEW</button>
			<!--  <input type="button" value="NEW"  />--> &nbsp;
			<button type="button" class="btn btn-outline-info" onclick="fn_myBoardList(this.form)">MY POST</button>
			<!--<input type="button" value="MY POST"  />-->
			<input type="hidden" name="mId" value="${loginUser.mId}" />
		</c:if>
	</form>
	</div>
<%@ include file="/templates/footer.jsp" %>