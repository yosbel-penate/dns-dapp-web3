/**
 * CSS para ocultar toda la página
 * Excepto los elementos que pertenecen a la clase "beastify-image".
 */
 const hidePage = `body > :not(.beastify-image) {
    display: none;
  }`;

/**
* Esucha los clicks en los botones y envía el mensaje apropiado
* al script de contenido de la página.
*/
function listenForClicks() {
document.addEventListener("click", (e) => {

/**
* Recibe el nombre de una bestia y obtiene la URL de la imagen correspondiente.
*/
function beastNameToURL(beastName) {
switch (beastName) {
case "Frog":
return browser.extension.getURL("beasts/frog.jpg");
case "Snake":
return browser.extension.getURL("beasts/snake.jpg");
case "Turtle":
return browser.extension.getURL("beasts/turtle.jpg");
}
}

/**
* Inserta dentro de la pestaña activa el CSS que oculta la página
* luego toma la URL de la imagen y
* envía un mensaje "beastify" al script de contenido de la pestaña activa.
*/
function beastify(tabs) {
browser.tabs.insertCSS({code: hidePage}).then(() => {
let url = beastNameToURL(e.target.textContent);
browser.tabs.sendMessage(tabs[0].id, {
command: "beastify",
beastURL: url
});
});
}

/**
* Remueve el CSS que oculta la página y
* envía un mensaje de "reset" al script de contenido de la pestaña activa.
*/
function reset(tabs) {
browser.tabs.removeCSS({code: hidePage}).then(() => {
browser.tabs.sendMessage(tabs[0].id, {
command: "reset",
});
});
}

/**
* Imprime el error en consola.
*/
function reportError(error) {
console.error(`Could not beastify: ${error}`);
}

/**
* Toma la pestaña activa y
* llama a "beastify()" o "reset()" según corresponda.
*/
if (e.target.classList.contains("beast")) {
browser.tabs.query({active: true, currentWindow: true})
.then(beastify)
.catch(reportError);
}
else if (e.target.classList.contains("reset")) {
browser.tabs.query({active: true, currentWindow: true})
.then(reset)
.catch(reportError);
}
});
}

/**
* Si hubo algún error al ejecutar el script,
* Despliega un popup con el mensaje de error y oculta la UI normal.
*/
function reportExecuteScriptError(error) {
document.querySelector("#popup-content").classList.add("hidden");
document.querySelector("#error-content").classList.remove("hidden");
console.error(`Failed to execute beastify content script: ${error.message}`);
}

/**
* Cuando se carga la ventana emergente, inyecta el script de contenido en la pestaña activa,
* y agrega un manejador de eventos.
* Si no es posible inyectar el script, se ocupa de manejar el error.
*/
browser.tabs.executeScript({file: "/content_scripts/beastify.js"})
.then(listenForClicks)
.catch(reportExecuteScriptError);