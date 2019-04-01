import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initSweetalert } from '../plugins/init_sweetalert';


initMapbox();

initSweetalert('#sweet-alert-demo', {
  title: "Merci pour votre réponse !",
  text: "Votre réponse a bien été prise en compte 😃",
  icon: "success"
});

