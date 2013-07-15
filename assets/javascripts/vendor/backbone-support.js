window.Support = {};
Support.VERSION = "0.4.0";
Support.Observer = function() {};

_.extend(Support.Observer.prototype, {
  bindTo: function(source, event, callback) {
    source.bind(event, callback, this);
    this.bindings = this.bindings || [];
    this.bindings.push({ source: source, event: event, callback: callback });
  },

  unbindFromAll: function() {
    _.each(this.bindings, function(binding) {
      binding.source.unbind(binding.event, binding.callback);
    });
    this.bindings = []
  }
});
Support.CompositeView = function(options) {
  this.children = _([]);
  Backbone.View.apply(this, [options]);
};

_.extend(Support.CompositeView.prototype, Backbone.View.prototype, Support.Observer.prototype, {
  leave: function() {
    this.trigger('leave');
    this.unbind();
    this.unbindFromAll();
    this.remove();
    this._leaveChildren();
    this._removeFromParent();
  },

  renderChild: function(view) {
    view.render();
    this.children.push(view);
    view.parent = this;
  },
  
  renderChildInto: function(view, container) {
    this.renderChild(view);
    this.$(container).html(view.el);
  },

  appendChild: function(view) {
    this.renderChild(view);
    this.$el.append(view.el);
  },
  
  appendChildTo: function (view, container) {
    this.renderChild(view);
    this.$(container).append(view.el);
  },
  
  prependChild: function(view) {
    this.renderChild(view);
    this.$el.prepend(view.el);
  },
  
  prependChildTo: function (view, container) {
    this.renderChild(view);
    this.$(container).prepend(view.el);
  },

  swapped: function () {
    this.trigger('swapped')
  },

  _leaveChildren: function() {
    this.children.chain().clone().each(function(view) {
      if (view.leave)
        view.leave();
    });
  },

  _removeFromParent: function() {
    if (this.parent)
      this.parent._removeChild(this);
  },

  _removeChild: function(view) {
    var index = this.children.indexOf(view);
    this.children.splice(index, 1);
  }
});

Support.CompositeView.extend = Backbone.View.extend;
Support.SwappingRouter = function(options) {
  Backbone.Router.apply(this, [options]);
};

_.extend(Support.SwappingRouter.prototype, Backbone.Router.prototype, {
  swap: function(newView) {
    if (this.currentView && this.currentView.leave) {
      this.currentView.leave();
    }

    this.currentView = newView;
    $(this.el).html(this.currentView.render().el);

    if (this.currentView && this.currentView.swapped) {
      this.currentView.swapped();
    }
  }
});

Support.SwappingRouter.extend = Backbone.Router.extend;
