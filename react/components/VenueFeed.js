import React from 'react';
import Tweet from './Tweet';

const VenueFeed = props => {
  let venues = props.data.map(venue => {
    return (
      <Venue
        key={venue.id_str}
        name={venue.user.name}
        image={venue.user.profile_image_url}
        description={venue.description}
        timestamp={Date(venue.timestamp_ms)}
        entities={venue.entities}
        handleButtonClick={props.handleButtonClick}
      />
    );
  });

  return (
    <ul>
      {venues}
    </ul>
  );
};

export default VenueFeed;
