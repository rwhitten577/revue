import React, { Component } from 'react';
import Venue from './Venue';

class VenueFeed extends Component {
  constructor(props) {
    super(props);
    this.state = {
      venues: []
    }
  }

  loadVenuesFromServer() {
    $.ajax({
      url: '/api/v1/venues',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ venues: data.venues });
    });
  }

  componentDidMount() {
    this.loadVenuesFromServer();
    setInterval(this.loadVenuesFromServer, 5000)
  }

  render() {
    let venues = this.state.venues.map(venue => {
      return (
        <Venue
          key={venue.id}
          venueId={venue.id}
          name={venue.name}
          street={venue.street}
          city={venue.city}
          state={venue.state}
          description={venue.description}
          avgRating={venue.avg_rating}
          photo={venue.photo.photo.url}
        />
      );
    });

    return (
      <div className="posts venues" >
        {venues}
      </div>
    );
  }
};

export default VenueFeed;
