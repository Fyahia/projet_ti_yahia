$(document).ready(function () {
    $("#seeSpoiler").click(function () {
        $("#spoiler").toggle();
    });

    $('#texte_bouton_modif').click(function (e) {
        e.preventDefault();
        let id_voiture = $('#id_voiture').val();
        let marque = $('#marque').val();
        let modele = $('#modele').val();
        let annee = $('#annee').val();
        let couleur = $('#couleur').val();
        let prix = $('#prix').val();
        let kilometrage = $('#kilometrage').val();
        let carburant = $('#carburant').val();
        let type_boite = $('#type_boite').val();

        let param = {
            id_voiture: id_voiture,
            marque: marque,
            modele: modele,
            annee: annee,
            couleur: couleur,
            prix: prix,
            kilometrage: kilometrage,
            carburant: carburant,
            type_boite: type_boite
        };

        console.log("param : ", param);

        $.ajax({
            url: './src/php/ajax/ajaxUpdateVoiture.php',
            type: 'GET',
            dataType: 'json',
            data: $.param(param),
            success: function (data) {
                if (data && data.error) {
                    console.error('Error in modification:', data.error);
                } else {
                    alert("Car modified successfully.");
                }
            },
            error: function (data) {
                console.log(data);
            }
        });
    });


    $('#texte_bouton_submit').click(function (e) {
        e.preventDefault();
        let marque = $('#marque').val();
        let modele = $('#modele').val();
        let annee = $('#annee').val();
        let couleur = $('#couleur').val();
        let prix = $('#prix').val();
        let kilometrage = $('#kilometrage').val();
        let carburant = $('#carburant').val();
        let type_boite = $('#type_boite').val();
        let image = $('#image').val();
        let param = 'marque=' + marque + '&modele=' + modele + '&annee=' + annee + '&couleur=' + couleur + '&prix=' + prix + '&kilometrage=' + kilometrage + '&carburant=' + carburant + '&type_boite=' + type_boite + '&image=' + image;
        $.ajax({
            url: './src/php/ajax/ajaxAjoutVoiture.php',
            type: 'GET',
            dataType: 'json',
            data: param,
            success: function (data) {
                alert("Voiture ajoutée avec succès.");
            },
            error: function (data) {
                console.log(data);
            }
        });
    });

    $('#texte_bouton_delete').click(function (e) {
        e.preventDefault();
        let id_voiture = $('#id_voiture').val();

        let param = {
            id_voiture: id_voiture
        };

        console.log("param : ", param);

        $.ajax({
            url: './src/php/ajax/AjaxDeleteVoiture.php',
            type: 'GET',
            dataType: 'json',
            data: $.param(param),
            success: function (data) {
                if (data && data.error) {
                    console.error('Erreur dans la suppression:', data.error);
                } else {
                    alert("Voiture supprimée avec succès.");
                }
            },
            error: function (data) {
                console.log(data);
            }
        });
    });


});