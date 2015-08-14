<%@ page import="com.domain.Filmshow" %>
<%@ page import="java.util.List" %>
<%@ page import="com.domain.Seat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>AddTicketAll</title>
    <link rel="stylesheet" href="../resources/css/styles.css"/>
    <script type="text/javascript" src="../resources/js/jquery-2.1.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#filmshow-select").change(function(){
                $.ajax({
                    url: "../ProcessServlet/SeatsFilter?filmshow-select=" + $("#filmshow-select").val()
                })
            });
            $("#ticket-add").submit(function (event) {
                if($("#filmshow-select").val() == null || $("#ticket-add-price").val() == "")
                        {
                            alert("Заполните поля");
                            event.preventDefault();
                        }
                else
                        {
                            alert("Билеты добавлены");
                        }
                });
            });
    </script>
</head>
<body>
<div class="wrapper">

    <jsp:include page="admin_menu.jsp"/>

    <p>Выпустить билеты</p>
    <form action="AddTicketAll" method="Get" id="ticket-add">
        <p><label for="filmshow-select">Сеанс </label><select name="filmshow-select" id="filmshow-select">
            <option selected disabled>Выберите сеанс</option>
            <%
                List<Filmshow> filmshowLst = (List<Filmshow>)session.getAttribute("filmshowList");

                for(Filmshow f: filmshowLst)
                {
            %>
            <option value=<%=f.getFilmshowId()%>><%=f%></option>
            <%
                }
            %>
        </select></p>
        <p><label for="ticket-add-price">Введите цену </label><input type="text" name="ticket-add-price" id="ticket-add-price"></p>
        <p><input type="submit" value="Выпустить билеты"></p>
    </form>

</div>
</body>
</html>
