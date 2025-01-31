class DCMap {
  constructor() {
    this.map = this.initializeMap("map");
    this.addStreetData();
    this.highlightedLayer = "";
    this.streetLookup = new Map();
  }


  /**
   * Use Leaflet to initialize a new map
   * @param {string} htmlId - HTML div ID to attach the map to
   * @returns L.Map (Leaflet Map)
   */

  initializeMap(htmlId) {
    /* Use Leaflet to initialize a new map on the provided html div */
    const map = L.map(htmlId).setView([38.9, -77.05], 15);
    this.addBaseMap(map);
    return map;
  }
  
  /**
   * Add street data to the map
   * @param {L.Map} map - Leaflet map
   */
  addStreetData() {
    // TODO: See if we can find a better roads layer eventually
    axios
      .get("/dcmap/street_centerlines_2013_small.geojson")
      .then((response) => {
        let tempStreets = L.geoJSON(response.data, {
          filter: this.onlyStreetsWithNamesFilter,
        });

        /*
          Populate streetLookup with collections of street segments organized by STCODE
        */
        tempStreets.eachLayer((layer) => {
          // Get street code from layer
          const streetCode = layer.feature.properties.STCODE;
          // Checks streetLookup for presence of STCODE key
          if (!this.streetLookup.has(streetCode)) {
            this.streetLookup.set(streetCode, L.featureGroup([]));
          }
          // Sets the value at key (STCODE) to the current layer
          this.streetLookup.get(streetCode).addLayer(layer);
        });

        /*
          Add streets to map
          Adds an action to each feature group
        */
        this.streetLookup.forEach((street) => {
          street.on({
            click: (event) => {
              this.highlightStreetOnClick(
                this.streetLookup.get(event.layer.feature.properties.STCODE)
              );
            },
            mouseover: (event) => {
              // Highlights road on mouse hover
              this.highlightStreetOnHover(
                this.streetLookup.get(event.layer.feature.properties.STCODE)
              );
            },
            // Removes highlight when no longer hover
            mouseout: (event) =>
              this.resetHighlight(
                this.streetLookup.get(event.layer.feature.properties.STCODE)
              ),
          });

          // Shows a popup of street name upon click
          street.bindPopup((layer) => {
            const props = layer.feature.properties;
            return `
              Street Name: ${props.ST_NAME} ${props.QUADRANT}<br>
              Chance of accident: ${Math.floor(Math.random() * 100) / 10} (fake number!)
            `;
          });
          this.map.addLayer(street);
        });
      })
      .catch((error) => {
        console.error("Error in axios promise:");
        console.error(error);
      });
  }

  /**
   * Add a basemap (the reference map behind the data)
   * More basemaps can be chosen from: http://leaflet-extras.github.io/leaflet-providers/preview/
   * @param {L.Map} map - Leaflet map
   */
  addBaseMap(map) {
    const Esri_WorldGrayCanvas = L.tileLayer(
      "https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}",
      {
        attribution: "Tiles &copy; Esri &mdash; Esri, DeLorme, NAVTEQ",
        maxZoom: 16,
      }
    );
    Esri_WorldGrayCanvas.addTo(map);
  }

  onlyStreetsWithNamesFilter(feature) {
    if (!!feature.properties.ST_NAME) return true;
  }

  highlightStreetOnClick(layer) {
    layer.setStyle({
      stroke: true,
      weight: 6,
      dasharray: "",
      opacity: 0.7,
      color: "#f3e726",
    });
    /**
     * Stores clicked street layer to later be reset to normal color after another street is clicked
     * **/
    if (this.highlightedLayer) {
      this.highlightedLayer.setStyle({
        weight: 5,
        color: "#3388ff",
        dashArray: "",
        fillOpacity: 1,
      });
      this.highlightedLayer = layer;
    } else {
      this.highlightedLayer = layer;
    }
  }

  highlightStreetOnHover(layers) {
    // If street layer is normal color, highlight street
    layers.eachLayer(function (layer) {
      layer.options.color == "#3388ff" &&
        layer.setStyle({
          stroke: true,
          weight: 8,
          dasharray: "",
          opacity: 0.7,
          color: "#ff5733",
        });
    });
  }

  resetHighlight(layers) {
    // if street layer is highlighted, return layer to normal color
    layers.eachLayer(function (layer) {
      layer.options.color == "#ff5733" &&
        layer.setStyle({
          weight: 5,
          color: "#3388ff",
          dashArray: "",
          fillOpacity: 1,
        });
    });
  }

  // Started to build a function that would adjust layer lines based on zoom level
  getZoomSize(){
    const zoomLevel = this.map.getZoom()
    console.log(zoomLevel)
  }

}

new DCMap();
