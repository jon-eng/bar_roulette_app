App.Views.Bar = Backbone.View.extend({

  initialize: function(){
    this.template = HandlebarsTemplates['bar'];
    this.render();
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
  },

  events: {
    'click #uber-estimate': 'getUberEstimate'
  },

  getUberEstimate: function(){
    var startLat = this.$('#start-lat').val();
    var startLng = this.$('#start-lng').val();
    var endLat = this.$('#end-lat').val();
    var endLng = this.$('#end-lng').val();

    var query = [startLat, startLng, endLat, endLng]

    $.ajax({
      url: '/ubers/search',
      method: 'GET',
      data: {
        query: query
      },
      reset: true
    }).done(function(ubers) {

      $("#uber-display").empty();
      App.ubersView.collection.reset(true);
      App.ubersView.collection.set(ubers);

    })

    model = this.model.toJSON();
    
    var newMap = new App.Views.Map({ model: model})
    
  }

});
