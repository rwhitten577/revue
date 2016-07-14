import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import VenueFeed from './components/VenueFeed';

$(function() {
  ReactDOM.render(
    <VenueFeed />,
    document.getElementById('venue-feed')
  );
});
