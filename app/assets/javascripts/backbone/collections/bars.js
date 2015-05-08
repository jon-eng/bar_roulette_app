App.Collections.Bars = Backbone.Collection.extend({

  model: App.Models.Bar,

  searchUrl: function (near, distance, bar_price){
  //api.foursquare.com/v2/venues/explore?ll=40.7,-74&client_id=BNAPSUX5Q2VGUM2JOAQGHXHGCK5WGGHWQPF2VWKZJG5XLKUL&client_secret=F4OSS11HXEOPZP41WPYYXDSV2NHR2BYZGZWNX44OJ3PEBLZ0&v=20150401&section=drinks&limit=5&radius=15000&price=2

  // var near = $('#near').val();
  // var distance = $('#distance').val();
  // var bar_price = $('#bar_price').val();

  return '/venues/explore?near=' + encodeURI(near) + '&radius=' + encodeURI(distance) + '&price=' + encodeURI(bar_price) 
  },

  search: function (near, distance, bar_price){
    $.getJSON(this.searchUrl(near, distance, bar_price))
    .done(this.reset.bind(this))
  }
 
});