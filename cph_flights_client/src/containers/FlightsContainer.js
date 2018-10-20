import React, { Component } from 'react';
import { connect } from 'react-redux';
import { TabContent, TabPane, Nav, NavItem, NavLink, Row, Col } from 'reactstrap';
import classnames from 'classnames';
import { loadFlights } from '../actions/action';
import FlightsComponent from '../components/FlightsComponent';

class FlightsContainer extends  Component {
    constructor(props) {
        super(props);
        this.state = {
            activeTab: '1'
        };
        this.props.loadFlights('departure');
    }

    toggle(tab) {
        const filterType = tab === '1' ? 'departure' : 'arrival';
        if (this.state.activeTab !== tab) {
            this.setState({
                activeTab: tab
            });
            this.props.loadFlights(filterType);
        }
    }

    render() {
        return(
            <div>
                <h2 className='App'>Copenhagen Airport's Flights</h2>
                <div sm="12" className="tab-section">
                    <Nav tabs className="m-3">
                        <NavItem>
                            <NavLink
                                className={classnames({ active: this.state.activeTab === '1' })}
                                onClick={() => { this.toggle('1'); }}
                            >
                                Departures
                            </NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink
                                className={classnames({ active: this.state.activeTab === '2' })}
                                onClick={() => { this.toggle('2'); }}
                            >
                                Arrivals
                            </NavLink>
                        </NavItem>
                    </Nav>
                    <TabContent activeTab={this.state.activeTab}>
                        <TabPane tabId="1">
                            <Row>
                                <Col sm="12">
                                    <FlightsComponent {...this.props}/>
                                </Col>
                            </Row>
                        </TabPane>
                        <TabPane tabId="2">
                            <Row>
                                <Col sm="12">
                                    <FlightsComponent {...this.props}/>
                                </Col>
                            </Row>
                        </TabPane>
                    </TabContent>
                </div>
            </div>
        )
    }
}
const mapDispatchToProps = (dispatch) => {
    return {
        loadFlights: (p1) => dispatch(loadFlights(p1))
    }
};
const mapStateToProps = (state) => {
    return {
        flights: state.flightReducer.flights
    }
};
export default connect(mapStateToProps, mapDispatchToProps)(FlightsContainer);