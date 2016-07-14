import React, { Component } from 'react';

const Venue = props => {
  debugger;
  return(
    <section className="post venue">
      <span className="image"><img src="http://www.tetongravity.com/images/ci-images/kickapps/PHOTO_6806949_75233_8288743_ap.jpg" alt="" /></span>
      <div className="content">
        <h3 className="venue-title"><strong><a href={"/venues/" + props.venueId}>{props.name}</a></strong></h3>
        <h3 className="venue-city">{props.city}, {props.state}</h3>
        <p>{props.description}</p>
        <ul className="actions">
          <li><a href={"/venues/" + props.venueId} className="button">More</a></li>
        </ul>
      </div>
    </section>
  );
};

export default Venue;
