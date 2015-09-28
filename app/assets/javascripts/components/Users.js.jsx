var Users = React.createClass({
  mixins: [ReactFireMixin],
  render: function() {
    rows = []
    this.props.users.forEach(function(user) {
      rows.push(
        <UsersRow key={user.id} user={user} />
      );
    });

  
    return (
      <table className={"table"} >
        <tr>
          <th>Phone number</th>
          <th>Joined time</th>
        </tr>
        {rows}
      </table>
    );
  },
  componentWillMount: function() {
    
  }

});