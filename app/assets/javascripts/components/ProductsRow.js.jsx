var ProductsRow = React.createClass({
  render: function() {
    return (
      <tr className={"product"} >
        <td className={"name"} >
          {this.props.product['name']}
        </td>
        <td className={"description"} >
          {this.props.product['description']}
        </td>
      </tr>
    );
  },
  componentWillMount: function() {
    
  }

});