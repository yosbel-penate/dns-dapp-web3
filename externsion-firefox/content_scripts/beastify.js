(function() {
    /**
     * Revisa e inicializa una variable de guardia.
     * Si este script de contenido es insertado más de una vez
     * en la misma página, dejará de ejecutarse.
     */
    if (window.hasRun) {
      return;
    }
    window.hasRun = true;
  
  /**
  * Recibe la URL de la imagen, remueve las que se hayan agregado antes,
  * crea un nodo IMG que apunt hacia la imagen
  * e inserta ese nodo en el documento.
  */
    function insertBeast(beastURL) {
      removeExistingBeasts();
      let beastImage = document.createElement("img");
      beastImage.setAttribute("src", beastURL);
      beastImage.style.height = "100vh";
      beastImage.className = "beastify-image";
      document.body.appendChild(beastImage);
    }
  
    /**
     * Remueve todas las bestias de la página.
     */
    function removeExistingBeasts() {
      let existingBeasts = document.querySelectorAll(".beastify-image");
      for (let beast of existingBeasts) {
        beast.remove();
      }
    }
  
    /**
     * Atiende mensajes del script de segundo plano.
     * Llama a "beastify()" o "reset()".
    */
    browser.runtime.onMessage.addListener((message) => {
      if (message.command === "beastify") {
        insertBeast(message.beastURL);
      } else if (message.command === "reset") {
        removeExistingBeasts();
      }
    });
  
  })();