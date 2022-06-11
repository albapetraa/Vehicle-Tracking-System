
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yazılım Laboratuvarı-2 1.Proje</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css">

            <link rel="stylesheet" href="http://weareoutman.github.io/clockpicker/dist/jquery-clockpicker.min.css"/>

            <link rel="stylesheet" type="text/css" href="css/dashboard.css"/>
            <link rel="stylesheet" type="text/css" href="css/mapstyle.css" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
                    integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                    integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
            crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/clockpicker/0.0.7/bootstrap-clockpicker.js"></script>

            </head>
            <body>

            <div id="wrapper" class="toggled">

                <!-- Sidebar -->
                <div id="sidebar-wrapper">
                    <ul class="sidebar-nav">
                        <li class="sidebar-brand">
                            <a href="/">
                                YazLab Proje
                            </a>
                        </li>
                        <li>
                            <a href="/welcome">Ana Sayfa</a>
                        </li>
                        <li>
                            <a href="/anlik">Anlık Konum Bilgileri</a>
                        </li>
                        <li>
                            <a href="/sonkonumlar">Son Konumlar</a>
                        </li>
                        <li>
                            <a href="/gecmiskonum">Geçmiş Konum Sorgulama</a>
                        </li>
                        <li>
                            <a href="/logout">Çıkış Yap</a>
                        </li>


                    </ul>
                </div>
                <!-- /#sidebar-wrapper -->

                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <h1>Yazılım Laboratuvarı-2 Proje 1</h1>
                        <h4>Araçlarınızın geçmiş konum bilgilerini aşağıdaki formu doldurduktan sonra sorgula butonuna basarak sorgulayabilirsiniz.</h4>
                        <h1>Zaman: ${mevcutGun} ${mevcutSaat} </h1>



                        <form action="/gecmiskonum" method="post">
                            <div class="col-7">
                                <select id="carselect" name="carselect" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${carIds}" var="car">
                                        <option selected>${car}</option>
                                    </c:forEach>
                                    <option selected>Araç numarası seçin</option>
                                </select>
                                <br><!-- comment -->
                                <input id="startDate" name="startDate" class="form-control" type="date" value="${mevcutGun}" />
                                <br><!-- comment -->
                                <div class="input-group clockpicker">
                                    <input id="startTime" name="startTime" type="text" class="form-control" value="" placeholder="Başlangıç Saati Seçin"/>
                                </div>
                                <br><!-- comment -->
                                <div class="input-group clockpicker">
                                    <input id="endTime" name="endTime" type="text" class="form-control" value="" placeholder="Bitiş Saati Seçin"/>
                                </div>
                                <br><!-- comment -->
                                <button type="submit" class="btn btn-primary btn-block">Sorgula</button>

                            </div>
                        </form>



                        <div id="map"></div>

                    </div>
                </div>
                <!-- /#page-content-wrapper -->

            </div>


            <script>
                $(document).ready(function () {
                    $('.clockpicker').clockpicker({
                        placement: 'top',
                        align: 'left',
                        donetext: 'Done',
                        'default': '12:34'
                    });
                    var x = "${mevcutSaat}";
                    var string = x[0] + "" + x[1];
                    var saat = Number(string);
                    var yenisaat;
                    if (saat == 0) {
                        yenisaat = 23;
                    } else {
                        yenisaat = saat - 1;
                    }

                    if (saat < 10) {
                        saat = "0" + String(saat);
                    }
                    if (yenisaat < 10) {
                        yenisaat = "0" + String(yenisaat);
                    }
                    console.log("saat: " + saat + " yenisaat: " + yenisaat);
                    document.getElementById("startTime").value = yenisaat + ":" + x[3] + x[4];
                    document.getElementById("endTime").value = saat + ":" + x[3] + x[4];

                });

                let startDate = document.getElementById('startDate')
                var date
                startDate.addEventListener('change', (e) => {
                    let startDateVal = e.target.value
                    console.log(typeof startDateVal)
                    date = startDateVal
                    document.getElementById('startDate').innerText = startDateVal
                })
                var x = "${mevcutSaat}";
                var string = x[0] + "" + x[1];
                var saat = Number(string);
                var yenisaat;
                if (saat == 0) {
                    yenisaat = 23;
                } else {
                    yenisaat = saat - 1;
                }

                if (saat < 10) {
                    saat = "0" + String(saat);
                }
                if (yenisaat < 10) {
                    yenisaat = "0" + String(yenisaat);
                }
                console.log("saat: " + saat + " yenisaat: " + yenisaat);
                document.getElementById("startTime").value = yenisaat + ":" + x[3] + x[4];
                document.getElementById("endTime").value = saat + ":" + x[3] + x[4];


                var carId = [];

                <c:forEach items="${carIds}" var="vehicle">
                carId.push(<c:out value="${vehicle}" />);
                </c:forEach>




            </script>


            </body>

            </html>