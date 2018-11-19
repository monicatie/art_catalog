import React from 'react';
import './Artwork.css';

function Artwork({name, artist, createdDate, museum, visitDate, url}) {
    return (
      <div>
        <div className="description">
            <div>"{name}"</div>
            <div>{artist}</div>
            <div>{createdDate}</div>
            <div>Seen at {museum} on {visitDate}</div>
        </div>
        <img className="artwork" src={require("./IMG_20181104_172451_746.jpg")} />
      </div>
    );
}

export default Artwork;
