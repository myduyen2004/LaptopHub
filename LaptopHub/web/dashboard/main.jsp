<%-- 
    Document   : main
    Created on : Jun 20, 2024, 9:37:20 PM
    Author     : admin
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: [
                        "Font Awesome 5 Solid",
                        "Font Awesome 5 Regular",
                        "Font Awesome 5 Brands",
                        "simple-line-icons",
                    ],
                    urls: ["assets/css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
    </head>
    <body>
        <%@include file="left-container.jsp" %>
        <%@include file="nav-admin.jsp" %>
        <div class="container">
            <div class="page-inner">
                <div
                    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
                    >
                    <div>
                        <h3 class="fw-bold mb-3">Tổng quan</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 col-md-3">
                        <div class="card card-stats card-round">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-icon">
                                        <div
                                            class="icon-big text-center icon-primary bubble-shadow-small"
                                            >
                                            <i class="fas fa-users"></i>
                                        </div>
                                    </div>
                                    <div class="col col-stats ms-3 ms-sm-0">
                                        <div class="numbers">
                                            <p class="card-category">Khách hàng</p>
                                            <h4 class="card-title">${numOfCustomer}</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="card card-stats card-round">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-icon">
                                        <div
                                            class="icon-big text-center icon-info bubble-shadow-small"
                                            >
                                            <i class="fas fa-palette"></i>
                                        </div>
                                    </div>
                                    <div class="col col-stats ms-3 ms-sm-0">
                                        <div class="numbers">
                                            <p class="card-category">Sản phẩm</p>
                                            <h4 class="card-title">${numOfProduct}</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="card card-stats card-round">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-icon">
                                        <div
                                            class="icon-big text-center icon-success bubble-shadow-small"
                                            >
                                            <i class="fas fa-luggage-cart"></i>
                                        </div>
                                    </div>
                                    <div class="col col-stats ms-3 ms-sm-0">
                                        <div class="numbers">
                                            <p class="card-category">Doanh thu</p>
                                            <h4 class="card-title">${totalRvenue}</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="card card-stats card-round">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-icon">
                                        <div
                                            class="icon-big text-center icon-secondary bubble-shadow-small"
                                            >
                                            <i class="far fa-check-circle"></i>
                                        </div>
                                    </div>
                                    <div class="col col-stats ms-3 ms-sm-0">
                                        <div class="numbers">
                                            <p class="card-category">Đã bán</p>
                                            <h4 class="card-title">${totalSold}</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="card card-round">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">DOANH THU THEO THÁNG</div>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="lineChart"></canvas>
                                        <canvas id="htmlLegendsChart" hidden></canvas>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-primary card-round">
                            <div class="card-header">
                                <div class="card-head-row">
                                    <div class="card-title">Doanh số ngày</div>
                                    <div class="card-tools">

                                    </div>
                                </div>
                                <div class="card-category">Hôm nay</div>
                            </div>
                            <div class="card-body pb-0">
                                <div class="mb-4 mt-2">
                                    <h1>${todayRevenue} VNĐ</h1>
                                </div>
                                <div class="pull-in">
                                    <canvas id="dailySalesChart"></canvas>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-round">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="table-responsive table-hover table-sales">
                                        <h4 class="card-title">Nhà cung cấp</h4>
                                        <table class="table">
                                            <tbody>
                                                <c:forEach var= "supplier" items= "${supplierList}" >
                                                    <tr>
                                                        <td>
                                                            <div class="flag">
                                                                <img style="height: 30px; width: 40px"
                                                                     src="${supplier.getImgLogo()}"
                                                                     />
                                                            </div>
                                                        </td>
                                                        <td>${supplier.getCompanyName()}</td>
                                                        <td class="text-end">${supplier.getCountry()}</td>
                                                        <td class="text-end"><a href="${supplier.getHomePage()}">Website ${supplier.getCompanyName()}</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card-title">Khách hàng thân thiết</div>

                                    <div class="card-list py-4">
                                        <c:forEach var= "user" items ="${topUser}" >
                                            <div class="item-list">
                                                <div class="avatar">
                                                    <img style="height: 50px; width: 50px"
                                                         src="${user.getImage()}"
                                                         />
                                                </div>
                                                <div class="info-user ms-3">
                                                    <div class="username">${user.getUserName()}</div>
                                                    <div class="status">${user.getFullName()}</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script src="assets/js/demo.js"></script>
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>
        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>
        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo2.js"></script>
        <script>
        var lineChart = document.getElementById("lineChart").getContext("2d"),
                htmlLegendsChart = document
                .getElementById("htmlLegendsChart")
                .getContext("2d");

        var myLineChart = new Chart(lineChart, {
            type: "line",
            data: {
                labels: [
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    "7",
                    "8",
                    "9",
                    "10",
                    "11",
                    "12"
                ],
                datasets: [
                    {
                        label: "Doanh thu",
                        borderColor: "#1d7af3",
                        pointBorderColor: "#FFF",
                        pointBackgroundColor: "#1d7af3",
                        pointBorderWidth: 2,
                        pointHoverRadius: 4,
                        pointHoverBorderWidth: 1,
                        pointRadius: 4,
                        backgroundColor: "transparent",
                        fill: true,
                        borderWidth: 2,
                        data: [
            ${monthlyRevenue1}, ${monthlyRevenue2}, ${monthlyRevenue3}, ${monthlyRevenue4}, ${monthlyRevenue5},
            ${monthlyRevenue6}, ${monthlyRevenue7}, ${monthlyRevenue8}, ${monthlyRevenue9}, ${monthlyRevenue10}, ${monthlyRevenue11}, ${monthlyRevenue12}
                        ]
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    position: "bottom",
                    labels: {
                        padding: 10,
                        fontColor: "#1d7af3"
                    }
                },
                tooltips: {
                    bodySpacing: 4,
                    mode: "nearest",
                    intersect: 0,
                    position: "nearest",
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                layout: {
                    padding: {left: 15, right: 15, top: 15, bottom: 15}
                }
            }
        });


        // Chart with HTML Legends

        var myHtmlLegendsChart = new Chart(htmlLegendsChart, {
            type: "line",
            data: {
                labels: [
                    "Jan",
                    "Feb",
                    "Mar",
                    "Apr",
                    "May",
                    "Jun",
                    "Jul",
                    "Aug",
                    "Sep",
                    "Oct",
                    "Nov",
                    "Dec"
                ],
                datasets: [
                    {
                        label: "Subscribers",
                        borderColor: gradientStroke2,
                        pointBackgroundColor: gradientStroke2,
                        pointRadius: 0,
                        backgroundColor: gradientFill2,
                        legendColor: "#f3545d",
                        fill: true,
                        borderWidth: 1,
                        data: [
                            154, 184, 175, 203, 210, 231, 240, 278, 252, 312, 320, 374
                        ]
                    },
                    {
                        label: "New Visitors",
                        borderColor: gradientStroke3,
                        pointBackgroundColor: gradientStroke3,
                        pointRadius: 0,
                        backgroundColor: gradientFill3,
                        legendColor: "#fdaf4b",
                        fill: true,
                        borderWidth: 1,
                        data: [
                            256, 230, 245, 287, 240, 250, 230, 295, 331, 431, 456, 521
                        ]
                    },
                    {
                        label: "Active Users",
                        borderColor: gradientStroke,
                        pointBackgroundColor: gradientStroke,
                        pointRadius: 0,
                        backgroundColor: gradientFill,
                        legendColor: "#177dff",
                        fill: true,
                        borderWidth: 1,
                        data: [
                            542, 480, 430, 550, 530, 453, 380, 434, 568, 610, 700, 900
                        ]
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                tooltips: {
                    bodySpacing: 4,
                    mode: "nearest",
                    intersect: 0,
                    position: "nearest",
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                layout: {
                    padding: {left: 15, right: 15, top: 15, bottom: 15}
                },
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                fontColor: "rgba(0,0,0,0.5)",
                                fontStyle: "500",
                                beginAtZero: false,
                                maxTicksLimit: 5,
                                padding: 20,
                            },
                            gridLines: {
                                drawTicks: false,
                                display: false
                            }
                        }
                    ],
                    xAxes: [
                        {
                            gridLines: {
                                zeroLineColor: "transparent"
                            },
                            ticks: {
                                padding: 20,
                                fontColor: "rgba(0,0,0,0.5)",
                                fontStyle: "500"
                            }
                        }
                    ]
                },
                legendCallback: function (chart) {
                    var text = [];
                    text.push('<ul class="' + chart.id + '-legend html-legend">');
                    for (var i = 0; i < chart.data.datasets.length; i++) {
                        text.push(
                                '<li><span style="background-color:' +
                                chart.data.datasets[i].legendColor +
                                '"></span>'
                                );
                        if (chart.data.datasets[i].label) {
                            text.push(chart.data.datasets[i].label);
                        }
                        text.push("</li>");
                    }
                    text.push("</ul>");
                    return text.join("");
                }
            }
        });

        var myLegendContainer = document.getElementById("myChartLegend");

        // generate HTML legend
        myLegendContainer.innerHTML = myHtmlLegendsChart.generateLegend();

        // bind onClick event to all LI-tags of the legend
        var legendItems = myLegendContainer.getElementsByTagName("li");
        for (var i = 0; i < legendItems.length; i += 1) {
            legendItems[i].addEventListener("click", legendClickCallback, false);
        }
        </script>
    </body> 
</html>