<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.flour.web.dto.UserAccountDto" %>
<%@ page import="com.flour.web.domain.Users" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
    String name = "";
    String id = "";
    String role = "";
    String departmentName = "";
    String departmentId = "";
    String createdDate = "";
    boolean emailVerified;

    if (principal instanceof UserAccountDto) {
        name = ((UserAccountDto)principal).getUsers().getUserName();
        id = ((UserAccountDto)principal).getUsers().getUserIdennum();
        role = String.valueOf(((UserAccountDto)principal).getUsers().getUserRole());
        emailVerified = (((UserAccountDto) principal).getUsers().isUserEmailVerified());
        departmentName = ((UserAccountDto) principal).getUsers().getDepartmentName();
        departmentId = ((UserAccountDto) principal).getUsers().getDepartmentId();
        createdDate = String.valueOf(((UserAccountDto) principal).getUsers().getUserCreatedDate());


        pageContext.setAttribute("name", name);
        pageContext.setAttribute("id", id);
        pageContext.setAttribute("emailVerified", emailVerified);
        pageContext.setAttribute("role", role);
        pageContext.setAttribute("departmentName", departmentName);
        pageContext.setAttribute("departmentId", departmentId);
        pageContext.setAttribute("createdDate", createdDate);
    }

%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
    let stompClient = null;
    const currentUserId = ${id};
    const currentUserName = "${name}";
</script>
<script src="/js/chat.js"></script>