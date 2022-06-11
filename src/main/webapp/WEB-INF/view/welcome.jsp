
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yazılım Laboratuvarı-2 1.Proje</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="css/dashboard.css"/>
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
                <div class="card text-center">
                    <div class="card-header">
                        Hizmetlerimiz
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Araç Anlık Konum Bilgisi</h5>
                        <p class="card-text">Araçlarınızın anlık konum bilgilerini öğrenmek için buraya tıklayabilirsiniz.</p>
                        <a href="/anlik" class="btn btn-primary">Anlık Konum</a>
                    </div>
                    <div class="card-footer text-muted">
                        Sahip olduğunuz araçların anlık konumlarını gösteren bir özellik
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Araçlarınızın Son Konumları</h5>
                        <p class="card-text">Araçlarınızın son 30 dakikada bulundukları konumları öğrenmek için buraya tıklayabilirsiniz.</p>
                        <a href="/sonkonumlar" class="btn btn-primary">Son Konumlar</a>
                    </div>
                    <div class="card-footer text-muted">
                        Sahip olduğunuz araçların son 30 dakika içerisindeki konumlarını gösteren bir özellik
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Araç Geçmiş Konum Sorgulama</h5>
                        <p class="card-text">Araçlarınızın geçmiş zamanlardaki konum bilgilerini öğrenmek için buraya tıklayabilirsiniz.</p>
                        <a href="/gecmiskonum" class="btn btn-primary">Geçmiş Konumlar</a>
                    </div>
                    <div class="card-footer text-muted">
                        Sahip olduğunuz araçların anlık konumlarını gösteren bir özellik
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
    crossorigin="anonymous"></script>

</body>

</html>