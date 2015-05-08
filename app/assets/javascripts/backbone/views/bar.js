App.Views.Bar = Backbone.View.extend({

  initialize: function(){
    this.template = HandlebarsTemplates['bar'];
    this.render();
  },
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
  }
});