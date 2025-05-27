<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact Us - Dawn Airlines</title>
  <style>
    /* Base Reset */
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body, html { height: 100%; font-family: 'Segoe UI', sans-serif; background-color: #0a0a0a; color: #fff; }
    a { text-decoration: none; color: inherit; }

    /* Navbar */
    .navbar { background: #0a1c2c; padding: 1.2rem 2rem; display: flex; justify-content: space-between; align-items: center; }
    .navbar .logo { color: #f6c90e; font-size: 1.8rem; font-weight: bold; }
    .navbar ul { list-style: none; display: flex; gap: 1.5rem; }
    .navbar a { color: #fff; transition: color 0.3s; }
    .navbar a:hover,
    .navbar a.active { color: #f6c90e; }

    /* Contact Section */
    .contact-section { padding: 3rem 1rem; display: flex; justify-content: center; }
    .contact-form-container { display: flex; flex-wrap: wrap; gap: 2rem; max-width: 1100px; width: 100%; }

    /* Form Side */
    .form-side { flex: 1 1 400px; }
    .form-side h1 { font-size: 2rem; margin-bottom: 0.5rem; color: #f6c90e; }
    .form-side p { margin-bottom: 1.5rem; color: #ccc; }
    .contact-form { background: #111; padding: 2rem; border-radius: 12px; display: flex; flex-direction: column; gap: 1rem; }
    .contact-form input,
    .contact-form textarea { width: 100%; padding: 0.7rem; border: none; border-radius: 6px; background: #222; color: #fff; resize: vertical; }
    .contact-form button { padding: 0.8rem; background: #f6c90e; border: none; border-radius: 6px; color: #000; font-weight: bold; cursor: pointer; transition: background-color 0.3s; }
    .contact-form button:hover { background-color: #ffd700; }

    /* Departments & Social Icons */
    .departments { flex: 1 1 300px; }
    .departments h3 { margin-bottom: 0.5rem; color: #f6c90e; }
    .departments ul { list-style: none; margin-bottom: 1.5rem; }
    .departments li { margin-bottom: 0.5rem; display: flex; align-items: center; gap: 0.5rem; }
    .departments a { color: #fff; }
    .social-icons { display: flex; gap: 1rem; }
    .social-icons a { font-size: 1.5rem; color: #f6c90e; transition: color 0.3s; }
    .social-icons a:hover { color: #ffd700; }

    /* Responsive */
    @media (max-width: 768px) {
      .contact-form-container { flex-direction: column; align-items: center; }
    }
  </style>
</head>
<body class="contact">

  <!-- Navbar -->
  <header class="navbar">
    <div class="logo">Dawn Airlines</div>
    <nav>
      <ul>
        <li><a href="home">Home</a></li>
        <li><a href="contact" class="active">Contact Us</a></li>
        <li><a href="About">About Us</a></li>
        <li><a href="login">Login</a></li>
      </ul>
    </nav>
  </header>

  <!-- Contact Section -->
  <section class="contact-section">
    <div class="contact-form-container">

      <!-- LEFT SIDE: FORM -->
      <div class="form-side">
        <h1>Get in Touch</h1>
        <p>We’re here to help. Reach out to us through the form below.</p>

        <form class="contact-form">
          <input type="text" placeholder="Your Name" required />
          <input type="email" placeholder="Your Email" required />
          <textarea placeholder="Your Message" rows="5" required></textarea>
          <button type="submit">Send Message</button>
        </form>
      </div>

      <!-- RIGHT SIDE: SOCIAL AND DEPARTMENTS -->
      <div class="departments">
        <h3>Follow Our Teams:</h3>
        <ul>
          <li><i class="fab fa-instagram"></i> <a href="#">@dawn_support</a></li>
          <li><i class="fab fa-instagram"></i> <a href="#">@dawn_marketing</a></li>
          <li><i class="fab fa-instagram"></i> <a href="#">@dawn_hr</a></li>
          <li><i class="fab fa-instagram"></i> <a href="#">@dawn_crew</a></li>
        </ul>

        <h3>Corporate Accounts</h3>
        <div class="social-icons">
          <a href="#"><i class="fab fa-facebook"></i></a>
          <a href="#"><i class="fab fa-x-twitter"></i></a>
          <a href="#"><i class="fab fa-linkedin"></i></a>
          <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
      </div>

    </div>
  </section>

</body>
</html>
