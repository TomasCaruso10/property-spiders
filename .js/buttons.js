
async function RunSpidersForProp(primaryControl, selectedControllSelectedItemIds, flowUrl) {

  //  get property id
  var parentId = primaryControl.data.entity.getId().replace(/[{}]/g, '');

  // Fetch items
  const filter = selectedControllSelectedItemIds.map(id => `vbi_serviciospropiedadid eq ${id}`).join(" or ");
  const query = `?$filter=${filter}`;

  const result = await Xrm.WebApi.retrieveMultipleRecords("vbi_serviciospropiedad", query);
  const services = result.entities.map(e => e["vbi_proveedor@OData.Community.Display.V1.FormattedValue"].toLowerCase());
  
  var payload = {
    jobs: [
      {
        property_id: parentId,
        services: services
      }
    ]
  };

  fetch(flowUrl, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload)
  })
  .then(function () {
    Xrm.Navigation.openAlertDialog({ text: "✔ Flujo ejecutado correctamente." });
  })
  .catch(function (err) {
    Xrm.Navigation.openErrorDialog({ message: "Error al ejecutar flujo: " + (err.message || err) });
  });
}


function RunSpidersForManyProps(selectedControllSelectedItemIds, flowUrl) {
  const allServices = ['aysa', 'edenor', 'edesur', 'matanza', 'agip', 'metrogas']
  //  prop ids
  var propIds = selectedControllSelectedItemIds
  
  // Build jobs with all services for each property
  var jobs = propIds.map(id => ({
    property_id: id,
    services: allServices
  }))

  var payload = {
    jobs: jobs
  };

  fetch(flowUrl, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload)
  })
  .then(function () {
    Xrm.Navigation.openAlertDialog({ text: "✔ Flujo ejecutado correctamente." });
  })
  .catch(function (err) {
    Xrm.Navigation.openErrorDialog({ message: "Error al ejecutar flujo: " + (err.message || err) });
  });
}
