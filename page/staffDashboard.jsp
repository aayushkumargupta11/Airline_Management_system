<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dawn Airline Staff Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/staff.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* [Styles unchanged for brevity] */
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Dawn Airline</h2>
       <ul>
    <li><a href="${pageContext.request.contextPath}/staffDashboard" class="active">Dashboard</a></li>
    <li><a href="${pageContext.request.contextPath}/staff">Staff</a></li>
    <li><a href="${pageContext.request.contextPath}/staffTask">Staff Tasks</a></li>
    <li><a href="${pageContext.request.contextPath}/staffDepartment">Department</a></li>
    <li><a href="${pageContext.request.contextPath}/staffAttendance">Staff Attendance</a></li>
    <li><a href="${pageContext.request.contextPath}/reports">Reports</a></li>
    <li><a href="${pageContext.request.contextPath}/settings">Settings</a></li>
    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
</ul>

    </div>

    <div class="main-content">
  


        <div class="cards">
            <div class="card">
                <h3>Total Employees</h3>
                <p><fmt:formatNumber value="${totalEmployees}"/></p>
            </div>
            <div class="card">
                <h3>Total Hours</h3>
                <p><fmt:formatNumber value="${totalHours}" maxFractionDigits="2"/></p>
            </div>
            <div class="card">
                <h3>Active Tasks</h3>
                <p><fmt:formatNumber value="${activeTasks}"/></p>
            </div>
            <div class="card">
                <h3>Pending Tasks</h3>
                <p><fmt:formatNumber value="${pendingTasks}"/></p>
            </div>
        </div>

        <div class="chart-row">
            <div class="card chart-card">
                <h3>Tasks Overview</h3>
                <div class="chart-container">
                    <canvas id="barChart"></canvas>
                </div>
            </div>
            <div class="card chart-card">
                <h3>Performance Summary</h3>
                <div class="chart-container">
                    <canvas id="pieChart"></canvas>
                </div>
            </div>
        </div>

        <div class="card performance-card">
            <h3>Recent Attendance</h3>
            <div class="attendance-list">
                <table>
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Clock In</th>
                            <th>Clock Out</th>
                            <th>Status</th>
                            <th>Hours</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${recentAttendance}" var="attendance">
                     <tr>
                      <td><fmt:formatDate value="${attendance.date}" pattern="MMM dd, yyyy"/></td>
                       <td><fmt:formatDate value="${attendance.clockIn}" pattern="HH:mm"/></td>
                        <td><fmt:formatDate value="${attendance.clockOut}" pattern="HH:mm"/></td>
                        <td><c:out value="${attendance.status}"/></td>
                        <td><fmt:formatNumber value="${attendance.workingHours}" maxFractionDigits="2"/></td>
                          </tr>
                     </c:forEach>
 
                    </tbody>
                </table>
            </div>

            <h3>Performance Overview</h3>

            <c:set var="excellent" value="${performanceDistribution['Excellent']}"/>
            <c:set var="good" value="${performanceDistribution['Good']}"/>
            <c:set var="average" value="${performanceDistribution['Average']}"/>
            <c:set var="poor" value="${performanceDistribution['Poor']}"/>

            <div class="performance-grid">
                <div class="performance-bars">
                    <c:forEach items="${performanceDistribution}" var="entry">
                        <div class="performance-item">
                            <span><c:out value="${entry.key}"/></span>
                            <div class="progress-bar">
                                <div class="progress ${entry.key.toLowerCase()}" 
                                     style="width: <fmt:formatNumber value="${entry.value * 10}" maxFractionDigits='0'/>%">
                                    <fmt:formatNumber value="${entry.value * 10}" maxFractionDigits="0"/>%
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="performance-stats">
                    <div class="stat-box">
                        <div class="stat-value">
                            <c:if test="${not empty topPerformer}">
                                <fmt:formatNumber value="${topPerformer.performanceScore}" maxFractionDigits="0"/>%
                            </c:if>
                        </div>
                        <div class="stat-label">Top Performer</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-value">
                            <fmt:formatNumber value="${avgRating}" maxFractionDigits="0"/>%
                        </div>
                        <div class="stat-label">Avg Rating</div>
                    </div>
                    <div class="stat-box positive">
                        <div class="stat-value">+5%</div>
                        <div class="stat-label">Improvement</div>
                    </div>
                </div>
            </div>

            <div class="action-buttons">
                <button class="custom-btn report-btn" onclick="window.location.href='${pageContext.request.contextPath}/reports'">
                    <span class="btn-icon">📊</span>
                    <span>Detailed Report</span>
                </button>
                <button class="custom-btn schedule-btn" onclick="window.location.href='${pageContext.request.contextPath}/scheduleReview'">
                    <span class="btn-icon">📅</span>
                    <span>Schedule Review</span>
                </button>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const barCtx = document.getElementById('barChart').getContext('2d');
            new Chart(barCtx, {
                type: 'bar',
                data: {
                    labels: ['Completed', 'In Progress', 'Pending', 'Overdue'],
                    datasets: [{
                        label: 'Tasks',
                        data: [
                            <c:out value="${completedTasksCount}"/>,
                            <c:out value="${inProgressTasksCount}"/>,
                            <c:out value="${pendingTasksCount}"/>,
                            <c:out value="${overdueTasksCount}"/>
                        ],
                        backgroundColor: ['#4CAF50', '#2196F3', '#FFC107', '#F44336']
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            const pieCtx = document.getElementById('pieChart').getContext('2d');
            new Chart(pieCtx, {
                type: 'pie',
                data: {
                    labels: ['Excellent', 'Good', 'Average', 'Poor'],
                    datasets: [{
                        data: [
                            <c:out value="${excellent != null ? excellent : 0}"/>,
                            <c:out value="${good != null ? good : 0}"/>,
                            <c:out value="${average != null ? average : 0}"/>,
                            <c:out value="${poor != null ? poor : 0}"/>
                        ],
                        backgroundColor: ['#4CAF50', '#2196F3', '#FFC107', '#F44336']
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
        });
    </script>
</body>
</html>
