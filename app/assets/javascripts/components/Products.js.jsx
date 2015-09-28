var Products = React.createClass({
  mixins: [ReactFireMixin],
  getInitialState: function() {
    return {
      products: this.props.products
    };
  },
  render: function() {
    rows = []
    this.state.products.forEach(function(product) {
      rows.push(
        <ProductsRow key={product.id} product={product} />
      );
    });

  
    return (
      <div>
        <ProductNewNotifications onNewProductAddedRealtime={this.handleNewProductAddedRealtime} />
        <table className={"table"} >
          <thead>
            <tr>
              <th>Name</th>
              <th>Description</th>
            </tr>
          </thead>
          <tbody>
            {rows}
          </tbody>
        </table>
      </div>
    );
  },
  componentWillMount: function() {
    
  },
  handleNewProductAddedRealtime: function(id, name, description, created_at) {
    var products = this.state.products;
    products.unshift({
      id: id,
      name: name,
      description: description,
      created_at: created_at
    });
    this.setState({
      products: products
    });
  }

});