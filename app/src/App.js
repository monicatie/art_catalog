import React, { Component } from 'react';
import Artwork from './Artwork';
import './App.css';

const debounce = require('lodash/debounce');

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {artist: ''};

    this.handleChange = this.handleChange.bind(this);
    this.getDebouncedQuery = this.getDebouncedQuery.bind(this);
  }

  handleChange(event) {
    this.setState({artist: event.target && event.target.value});

    const debouncedQuery = this.getDebouncedQuery();
    debouncedQuery();
  }

  getDebouncedQuery() {
    return debounce(() => {
      console.log("querying Db.....");
    }, 200, { 'maxWait': 1000 });
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <div>Art Catalogue</div>
        </header>
        <div className="content">
          <form>
            <label>
              Artist: 
              <input type="text" value={this.state.artist} onChange={this.handleChange} />
            </label>
          </form>
          <Artwork
            name="La Pisseuse"
            artist="Picasso"
            createdDate="August 1950"
            museum="SF MOMA"
            visitDate="February 3, 2017"
          />
        </div>
      </div>
    );
  }
}

export default App;
