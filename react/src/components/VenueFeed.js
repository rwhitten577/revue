import React, { Component } from 'react';
import Venue from './Venue';

class VenueFeed extends Component {
  constructor(props) {
    super(props);
    this.state = {
      venues: []
    }
  }

  componentDidMount() {
    $.ajax({
      url: '/api/v1/venues',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ venues: data.venues })
    });
  }

  render() {
    let venues = this.state.venues.map(venue => {
      return (
        <Venue
          key={venue.id}
          street={venue.street}
          city={venue.city}
          state={venue.state}
          description={venue.description}
          avgRating={venue.avg_rating}
        />
      );
    });

    return (
      <ul className="venue-feed">
        {venues}
      </ul>
    );
  }
};

export default VenueFeed;
