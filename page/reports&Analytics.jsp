<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reports and Analytics</title>
    <style>
        /* RESET & GLOBAL STYLES */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Open Sans', Arial, sans-serif;
        }

        body {
            color: #333;
            background: #f7f9fc;
            transition: all 0.3s ease;
        }

        /* SIDEBAR */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100vh;
            padding: 20px;
            color: #ecf0f1;
            background: linear-gradient(135deg, #2c3e50 0%, #3d566e 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: width 0.3s ease, padding 0.3s ease;
        }

        .sidebar nav .bottom {
            margin-top: 240px;
        }

        .sidebar nav .bottom img {
            display: block;
            margin: 0 auto 20px auto;
            border: 2px solid #ccc;
            width: 70px;
            border-radius: 10%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .sidebar img {
            width: 100px;
            margin-bottom: 10px;
            border-radius: 50%;
        }

        .sidebar .logo {
            width: 100px;
            margin-bottom: 55px;
        }

        .sidebar nav a {
            display: block;
            color: #ecf0f1;
            text-decoration: none;
            padding: 10px 15px;
            margin: 8px 0;
            border-radius: 5px;
            transition: background 0.3s, transform 0.3s;
            text-align: center;
            font-weight: 600;
        }

        .sidebar nav a:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }

        /* MAIN CONTENT */
        .main {
            margin-left: 250px;
            padding: 20px;
            transition: padding 0.3s ease;
        }

        .page-title {
            font-size: 1.5rem;
            color: #444;
            margin-bottom: 20px;
        }

        /* FILTERS */
        .filters-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
            align-items: flex-end;
        }

        .filter-item {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .filter-item label {
            font-weight: 600;
            color: #555;
        }

        .filter-item input[type="text"],
        .filter-item input[type="date"],
        .filter-item select {
            padding: 8px;
            border: 2px solid #ccc;
            border-radius: 8px;
            outline: none;
        }

        .date-range-inputs {
            display: flex;
            gap: 10px;
        }

        .refresh-btn {
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            background: #1A73E8;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s, transform 0.3s;
        }

        .refresh-btn:hover {
            background: #1667c1;
            transform: scale(1.03);
        }

        /* STATS OVERVIEW */
        .stats-overview {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }

        .stats-box {
            background: #fff;
            border-radius: 8px;
            padding: 20px;
            min-width: 200px;
            flex: 1;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            text-align: center;
        }

        .stats-box h3 {
            margin-bottom: 10px;
            font-weight: 600;
            color: #555;
        }

        .stats-box p {
            font-size: 0.9rem;
            color: #333;
        }

        /* MOST ACTIVE ROUTES */
        .most-active-routes {
            background: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
        }

        .most-active-routes h3 {
            margin-bottom: 15px;
            color: #444;
            font-weight: 600;
        }

        .routes-grid {
            display: flex;
            gap: 40px;
            flex-wrap: wrap;
        }

        .route-item p {
            margin-left: 30px;
            color: #333;
            margin-bottom: 5px;
        }

        /* FLIGHT PERFORMANCE TABLE */
        .flight-performance {
            background: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
        }

        .flight-performance h3 {
            margin-bottom: 15px;
            color: #444;
            font-weight: 600;
        }

        .performance-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px;
        }

        .performance-table thead {
            background: #f2f2f2;
        }

        .performance-table th,
        .performance-table td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #ccc;
        }

        .performance-table tbody tr:hover {
            background: #f9f9f9;
        }
    </style>
</head>

<body>
    <div class="sidebar">
        <img src="plane.png" alt="Airline Logo" class="logo" />
        <nav>
            <a href="#">Dashboard</a>
            <a href="#">Search Flights</a>
            <a href="#">Flight Details</a>
            <a href="#">Payment Page</a>
            <a href="#">My Bookings</a>
            <a href="#">Online Check-in</a>
            <div class="bottom">
                <img src="m.jpg" alt="Profile Picture" />
                <a href="#">Settings</a>
            </div>
        </nav>
    </div>

    <div class="main">
        <h1 class="page-title">Reports & Analytics</h1>

        <div class="filters-container">
            <div class="filter-item">
                <label for="start-date">Date Range Filter</label>
                <div class="date-range-inputs">
                    <input type="date" id="start-date" name="start-date" />
                    <input type="date" id="end-date" name="end-date" />
                </div>
            </div>
            <div class="filter-item">
                <label for="flight-filter">Flight Filter</label>
                <select id="flight-filter" name="flight-filter">
                    <option value="">Select Flight</option>
                    <option value="F123">F123</option>
                    <option value="Q456">Q456</option>
                    <option value="A789">A789</option>
                </select>
            </div>
            <div class="filter-item">
                <label for="route-filter">Route Filter</label>
                <input type="text" id="route-filter" name="route-filter" placeholder="e.g. KTM-DEL" />
            </div>
            <button class="refresh-btn">Refresh</button>
        </div>

        <div class="stats-overview">
            <div class="stats-box">
                <h3>Total Bookings</h3>
                <p>1,000</p>
            </div>
            <div class="stats-box">
                <h3>Total Revenue</h3>
                <p>$48,000</p>
            </div>
            <div class="stats-box">
                <h3>Flights Operated</h3>
                <p>86</p>
            </div>
            <div class="stats-box">
                <h3>Cancellations</h3>
                <p>62</p>
            </div>
        </div>

        <div class="most-active-routes">
            <h3>Most Active Routes</h3>
            <div class="routes-grid">
                <div class="route-item">
                    <h4>KTM-DEL</h4>
                    <p>320</p>
                </div>
                <div class="route-item">
                    <h4>KTM-DOH</h4>
                    <p>180</p>
                </div>
            </div>
        </div>

        <div class="flight-performance">
            <h3>Flight Performance Table</h3>
            <table class="performance-table">
                <thead>
                    <tr>
                        <th>Flight No</th>
                        <th>Route</th>
                        <th>On-Time %</th>
                        <th>Delay %</th>
                        <th>Cancel %</th>
                        <th>Revenue</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>F123</td>
                        <td>KTM-DEL</td>
                        <td>95%</td>
                        <td>3%</td>
                        <td>2%</td>
                        <td>$10,130</td>
                    </tr>
                    <tr>
                        <td>Q456</td>
                        <td>KTM-DOH</td>
                        <td>88%</td>
                        <td>10%</td>
                        <td>2%</td>
                        <td>$8,100</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>