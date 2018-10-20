import React, { Component } from 'react';
import './App.css';
import FlightsContainer from './containers/FlightsContainer';

class App extends Component {
    render() {
        return (
            <div className="App">
                <header className="App-header">
                    <h1 className="App-title">Hello!</h1>
                </header>
                <FlightsContainer />
            </div>
        );
    }
}

export default App;