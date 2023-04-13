
function viewdata(i) {


    document.getElementById('exampleFormControlTextarea1').value = "";
    document.getElementById('nooforder').value = 1;
    var no = document.getElementById('no' + i).value;
    var name = document.getElementById('name' + i).value;
    var price = document.getElementById('price' + i).value;

    var des = document.getElementById('des' + i).value;

    document.getElementById('hcprice').innerHTML = price;
    document.getElementById('cname').innerHTML = name;
    document.getElementById('cdes').innerHTML = des;
    document.getElementById("cimg").src = "img/2.jpg";
    /*  document.getElementById('cprice').innerHTML = price;*/
}
function pluse()
{
    n = document.getElementById('nooforder');
    var p = document.getElementById('hcprice').innerHTML;
    no = parseInt(n.value);
    price = parseInt(p);
    no++;

    n.value = no;
    /*document.getElementById('cprice').innerHTML = price * no;*/

}
function minus()
{
    n = document.getElementById('nooforder');
    var p = document.getElementById('hcprice').innerHTML;
    no = parseInt(n.value);
    price = parseInt(p);
    no--;
    if (no <= 0)
    {
        alert('min order 1');
    }

    else {
        n.value = no;

    }

}
var i = 0;
function addtocart()
{
    i++;
    var price, no;
    var name = document.getElementById('cname').innerHTML;
    n = document.getElementById('nooforder');
    var p = document.getElementById('hcprice').innerHTML;
    no = parseInt(n.value);
    price = parseInt(p);

    var table = document.getElementById("table");
    var row = table.insertRow(1);
    var tname = row.insertCell(0);
    var trate = row.insertCell(1);
    var tq = row.insertCell(2);
    var total = row.insertCell(3);
    var remark = row.insertCell(4);
    tname.innerHTML = name;
    trate.innerHTML = price;
    tq.innerHTML = no;
    total.innerHTML = price * no;
    remark.innerHTML = "<button  onclick=deleteRow(this)>&#9940</button>";
    gtotal();

}
function deleteRow(r) {

    var k = r.parentNode.parentNode.rowIndex;

    document.getElementById("table").deleteRow(k);


    gtotal();
}


function gtotal() {
    var col = 0, gtotal = 0;
    var table = document.getElementById("table");
    var j = table.rows.length;
    var i = j - 1;
    if (i >= 1) {
        for (var k = i; k >= 1; k--) {


            console.log(k);
            var c = document.getElementById("table").rows[k].cells.item(3).innerHTML;
            col = parseInt(c);
            var gtotal = gtotal + col;

        }
        document.getElementById('gtotal').innerHTML = gtotal;

    }
    else {
        document.getElementById('gtotal').innerHTML = 0;
    }



}
function resetable() {
    var length = document.getElementById("table").rows.length;
    console.log(" + " + length);

    var k = 6;
    for (var i = 0; i < length - 1; i++) {
        document.getElementById("table").deleteRow(1);
    }
    gtotal();
}
function order() {

    var table = document.getElementById("table");
    var j = table.rows.length;
    var i = j - 1;
   
    if (i >= 1) {
        for (var k = i; k >= 1; k--) {
            var name = document.getElementById("table").rows[k].cells.item(0).innerHTML;
            console.log(name);
            var rate = document.getElementById("table").rows[k].cells.item(1).innerHTML;
            console.log(rate);
            var qun = document.getElementById("table").rows[k].cells.item(2).innerHTML;
            console.log(qun);
        }

    }
    resetable();

}
function test()
{

    console.log('loading ............');
}