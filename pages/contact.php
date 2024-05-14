
    <!-- CSS de Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

<div class="container">
    <h1>Contactez-nous</h1>
    <form action="contact.php" method="post">
        <div class="form-group">
            <label for="name">Nom:</label>
            <input type="text" id="name" name="name" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="subject">Sujet:</label>
            <input type="text" id="subject" name="subject" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="message">Message:</label>
            <textarea id="message" name="message" class="form-control" required></textarea>
        </div>
        <input type="submit" value="Envoyer" class="btn btn-primary">
    </form>
</div>
<!-- JS de Bootstrap -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
