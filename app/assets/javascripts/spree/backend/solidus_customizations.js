Spree.routes.customizations_api = function(line_item_id) {
  return Spree.pathFor('api/line_items/' + line_item_id + '/customizations');
};
