var Products = React.createClass({
  mixins: [ReactFireMixin],
  render: function() {
    rows = []
    this.props.products.forEach(function(product) {
      rows.push(
        <ProductsRow key={product.id} product={product} />
      );
    });

  
    return (
      <table className={"table"} >
        <tr>
          <th>Name</th>
          <th>Description</th>
        </tr>
        {rows}
      </table>
    );
  },
  componentWillMount: function() {
    
  }

});