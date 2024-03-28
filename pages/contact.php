<!DOCTYPE html>
<html>
<head>
    <title>Contact</title>
</head>
<body>
<h1>Contactez-nous</h1>
<form action="contact.php" method="post">
    <label for="name">Nom:</label><br>
    <input type="text" id="name" name="name" required><br>
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br>
    <label for="subject">Sujet:</label><br>
    <input type="text" id="subject" name="subject" required><br>
    <label for="message">Message:</label><br>
    <textarea id="message" name="message" required></textarea><br>
    <input type="submit" value="Envoyer">
</form>
</body>
</html>