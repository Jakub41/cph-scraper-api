import React, { Component } from 'react';
import './App.css';
import FlightsContainer from './containers/FlightsContainer';
import logo from './images/flight.svg';

class App extends Component {
    render() {
        return (
            <div className="App">
                <header className="App-header">
                    <img src={logo} className="logo" />
                    <h1 className="App-title d-none d-sm-block">Copenhagen Airport's Flights</h1>
                </header>
                <FlightsContainer />
            </div>
        );
    }
}

export default App;