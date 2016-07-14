import React from 'react';


const Venue = props => {
  let retweetColor = "";
  let favoriteColor = "";
  if (props.retweeted === true)
    {retweetColor = "green"};
  if (props.favorited === true)
    {favoriteColor = "red"};
  let mediaLink = props.entities
  if (Object.keys(mediaLink).length !== 0){
    var mediaImg = <img src={mediaLink.media[0].media_url}/>
  };
  return (
    <div className="venues">
        <br />
        <div className="columns small-centered">
          <div className="columns small-1 small-left">
            <img src={props.image} /></div>
              <div className="columns small-11 small-right">
            {props.name}&nbsp;&nbsp;
            <element className="gray">{props.timestamp}</element>
            <br />
            {props.text}
            <br />
            <div className="mediaImg">{mediaImg}</div>
            <br />
          <div className="icons">
            <i className="fa fa-reply"onClick={event => alert("Reply")}></i>
            &nbsp;{props.retweets}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <i className={"fa fa-retweet " + retweetColor } aria-hidden="true"onClick={event => alert("Retweet")}></i>
            &nbsp;{props.favorites}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <i className={"fa fa-heart " + favoriteColor } aria-hidden="true"onClick={event => alert("Like")}></i>
            &nbsp;{props.favorited}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <i className="fa fa-ellipsis-h" aria-hidden="true"onClick={event => alert("Favorite")}></i>
            </div>
            <br />
          </div>
        </div>
      </div>
      <br />
    </div>
  );
};

export default Tweet;
