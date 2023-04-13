<%-- 
    Document   : index
    Created on : Aug 12, 2020, 12:55:55 PM
    Author     : User
--%>

<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ishant</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="index.css">
        <script src="js/index.js"></script>

    </head>
    <body>


        <!--   Start  Menu --> 

        <div class="p-3 mb-2 bg-primary text-white"> 

            <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
            <button type="button" style="float:right; right: 0px; position: -webkit-sticky; position: sticky; top: 0;"  class="btn btn-primary m-2" data-toggle="modal" data-target="#exampleModalLong">
                &#127858; your order
            </button>
        </div>


        <div id="mySidenav" class="sidenav bg-primary text-white">
            <a href="javascript:void(0)" class="closebtn " onclick="closeNav()">&times;</a>

            <a href="hotel_detail.jsp">
                <img src="img/1.jpg" class="profile"> </a>
            <h3 class="name">Sakwo Resort</h3> 
            <hr> 
            <a href="#">About</a>
            <a href="#">Services</a>
            <a href="#">Clients</a>
            <a href="#">Contact</a>

        </div>

        <!--   END  Menu -->


        <!--Modal start -->

        <div class="modal fade"   tabindex="-1" role="dialog" id="exampleModalLong" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header bg-primary text-white">

                        <center> <h5 class="modal-title bg-primary" id="exampleModalLongTitle">YOUR ORDER</h5></center>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span> 
                       </button>
                    </div>
                    <div class="modal-body">

                        <div style="overflow-y: scroll; height:315px;" >

                            <table class="table table-bordered" id="table" border="5">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Iteam Name</th>
                                        <th scope="col"> Rate </th>
                                        <th scope="col"> Quantity </th>
                                        <th scope="col"> Total </th>
                                        <th scope="col"> Remark</th>
                                    </tr>
                                </thead><tbody>

                                </tbody>
                            </table>
                            Your Total :<p id="gtotal">0</p>

                        </div>

                    </div>

                    <div class="modal-footer"> 
  
                        <button class="btn btn-primary" data-dismiss="modal" aria-label="Close" type="button" onclick="order()" class="btn btn-primary">Conform order</button>
                    </div>

                </div>

            </div>
        </div>
        <!-- Model end -->





        <!--java start-->  

        <%

            out.println("<center>");
            try {
                Class forClass = Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodemo", "root", "");
                String sql = "SELECT  * FROM `menu`";
                PreparedStatement pst = conn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                PreparedStatement pst1 = conn.prepareStatement(sql);
                ResultSet rs1 = pst1.executeQuery();
                int k = 0;
                while (rs1.next()) {
                    k++;

                }
        %>

        <%
            int i = 0, no;

            String des[] = new String[k];
            String names[] = new String[k];
            int nos[] = new int[k];
            int prices[] = new int[k];
            String name;
            int price;
            while (rs.next()) {

                no = rs.getInt("no");
                name = rs.getString("name");
                price = rs.getInt("price");

                names[i] = rs.getString("name");
                nos[i] = rs.getInt("no");
                prices[i] = rs.getInt("price");
                des[i] = rs.getString("des");
        %>
    <center>
        <input id="no<%out.print(i);%>" type="hidden" value="<%out.println(nos[i]);%>">
        <input id="name<%out.print(i);%>" type="hidden" value="<%out.println(names[i]);%>">
        <input id="price<%out.print(i);%>" type="hidden" value="<%out.println(prices[i]);%>">
        <input id="des<%out.print(i);%>" type="hidden" value="<%out.println(des[i]);%>">
        <div class="card ml-4 mt-2 " style="width: 13rem; float:left;">
            <img class="card-img-top" src="img/2.jpg" alt="Card image cap">
            <div class="card-body">
                <h6> <B class="card-title"><%out.println(name);%></B></h6>
                <p class="card-text">NRs: <%out.println(price);%></p>


                <button type="button" style=" right: 0px; position: -webkit-sticky; position: sticky; top: 0;"  class="btn btn-primary m-2" data-toggle="modal" data-target="#exampleModalLong1" onclick="viewdata(<%out.println(i);%>)">
                   Order
                </button>

            </div>
        </div>




        <!--Modal-2 start -->

        <div class="modal fade" id="exampleModalLong1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header bg-primary text-white">

                        <center> <h5 class="modal-title bg-primary" id="exampleModalLongTitle" >FOOD VIEW</h5></center>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div> 
                    <img id="cimg"class="card-img" src="">
                    <div class="body-body" style="overflow-y: scroll; height:190px; margin: 2px;" >   


                        <h3 class="mt-2" id="cname"></h3>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text btn btn-primary bg-primary text-white" onchange="pluse()" onclick="pluse(<%out.println(i);%>)">+</span>
                            </div>
                            <input type="number" min="1" class="form-control" id="nooforder" value="1"  readonly>
                            <div class="input-group-append">
                                <span class="input-group-text btn btn-primary bg-primary text-white"   onclick="minus()">-</span>
                            </div>

                        </div>
                        <div class="form-group"> 
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="1" placeholder="Enter a Notes/message to chef about this food"></textarea>
                        </div>  <b>Detail about the food </b>
                        <p id="cdes"></p>
                        <p class="float-left" id="hcprice" hidden></p>
                    </div>


                    <div class="modal-footer">

                        <button type="button" class="btn btn-primary"  data-dismiss="modal" onclick="addtocart()">Add to list </button>

                    </div>

                </div>
                </form>
            </div>
        </div> 

        <!-- Model-2 end -->


        <%
                    i++;
                }

                out.println("</center>");

            } catch (Exception e) {
                out.println(e);
            }


        %>

    </center>

    <!--java end-->
 
</body>
<script>

</script> 
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="js/menu.js"></script>
<script src="js/orders.js"></script>
</html>
