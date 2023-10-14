


    ArrayList<Mascota> mascotas = (ArrayList<Mascota>) session.getAttribute("mascotas");
    if (mascotas == null) {
        mascotas = new ArrayList<>();
    }
    
    String tipoMascota = request.getParameter("tipoMascota");
    String nombre = request.getParameter("nombre");
    String raza = request.getParameter("raza");
    String color = request.getParameter("color");
    int edad = Integer.parseInt(request.getParameter("edad"));
    

    Mascota mascota;
    if (tipoMascota.equals("Canino")) {
        int nivelEntrenamiento = Integer.parseInt(request.getParameter("nivelEntrenamiento"));
        mascota = new Canino(nombre, raza, color, edad, nivelEntrenamiento);
    } else {
        boolean toxoplasmosis = request.getParameter("toxoplasmosis") != null;
        mascota = new Felino(nombre, raza, color, edad, toxoplasmosis);
    }
    
    mascotas.add(mascota);
    session.setAttribute("mascotas", mascotas);

    response.sendRedirect("../index.html");
