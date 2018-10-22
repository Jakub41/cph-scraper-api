import React, { Component } from "react";
import { connect } from "react-redux";
import {
    TabContent,
    TabPane,
    Nav,
    NavItem,
    NavLink,
    Row,
    Col
} from "reactstrap";
import classnames from "classnames";
import { loadFlights } from "../actions/action";
import FlightsComponent from "../components/FlightsComponent";
// import { DEPARTURES_FIELDS, ARRIVAL_FIELDS } from '../constants/tableFields';
import Spinner from 'react-spinkit';

import moment from 'moment';
import SearchInput, {createFilter} from 'react-search-input'
import './react-search-input.css';

import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';


import './customize-table.css';
import './loader.css';





class FlightsContainer extends Component {
    constructor(props) {
        super(props);
        this.state = {
            activeTab: 1,
            // fields: DEPARTURES_FIELDS,

            filteredFlight: [],


            focused: null,
            date: moment(),
            time: -1,
            searchTerm: '',
        };
        this.props.loadFlights({ type: "departures"});
    }

    gettingDataFromServer = (tabIndex) => {
        let filterType = 'departures';
        if (tabIndex == 0) {
            filterType = this.state.activeTab === "1" ? "departures" : "arrivals";
        } else {
            filterType = tabIndex === 1 ? "departures" : "arrivals";

        }
        this.props.loadFlights({ type: filterType});
    }

    toggle(tab) {
        if (this.state.activeTab !== tab) {
            this.setState({
                activeTab: tab,
                // fields: tab === "1" ? DEPARTURES_FIELDS : ARRIVAL_FIELDS,
            });
            this.gettingDataFromServer(tab);
        }
    }


    componentDidMount = () => {
        console.log('refreshing data...')
        this.interval = setInterval(() => this.gettingDataFromServer(0), 1000 * 60 * 5);
    }

    componentWillUnmount = () => {
        clearInterval(this.interval);
    }


    searchUpdated = (term) => {
        this.setState({ searchTerm: term });
    }

    filteredFlights = (flights) => {
        const searchTerm = this.state.searchTerm.toLowerCase();
        return flights.filter(flight => {
            if (this.state.searchTerm != '') {
                let str = '';
                if (this.state.activeTab == 1) { str += flight.destination } else { str += flight.arriving_from }
                str += flight.airline;
                str += flight.flight_no;
                if ( !str.toLowerCase().includes(searchTerm) ) return false;
            }
            let date = moment(flight.date)

            if (!date.isSame(this.state.date, 'day')) {
                return false;
            }
            if (flight.time && this.state.hour >=0 && flight.time.split(':').length > 0) {
                let time = parseInt(flight.time.split(':')[0]);
                if (time != this.state.hour) { return false; }
            }
            return true;
        })
    }

    handleChangeDate = (date) => {
        this.setState({
            date: date
        });
    }

    render() {
        const { fields, activeTab } = this.state;
        const { isLoading, lastUpdatedDate } = this.props;
        const flights = this.filteredFlights(this.props.flights);

        const optionsTime = []
        optionsTime.push((<option value={-1} key={100} selected="true" disabled="disabled">Select Hour</option>))
        for (let i=0; i<24; i++) {
            optionsTime.push((<option value={i} key={i}>{ i < 10 ? '0' : '' }{i} : 00</option>))
        }

        return (
            <div>
                {  isLoading && (
                    <div className="loading-indicator">
                        <Spinner name="ball-scale-multiple" color="coral"/>
                        <div className="text-white">Loading...</div>
                    </div>
                )}
                {/* <h2 className="App">Copenhagen Airport's Flights</h2> */}
                <div className="container-fluid mt-3">
                    <div className="row">
                        <div className="col-md-3">
                            <div className="last-updated">Last Updated: {lastUpdatedDate.format('YYYY-MM-DD HH:mm:ss')}</div>
                        </div>
                        <div className="col-md-2">
                            <DatePicker
                                selected={this.state.date}
                                onChange={this.handleChangeDate}
                                style={{height: '100px'}}
                            />
                        </div>
                        <div className="col-md-2">
                            <select className="form-control hour-picker" onChange={(e) => { this.setState({ hour: e.target.value}) }}>
                                { optionsTime }
                            </select>
                        </div>
                        <div className="col-md-5">
                            <SearchInput className="search-input" onChange={this.searchUpdated} />
                        </div>
                    </div>
                    <div sm="12" className="tab-section">
                        <Nav tabs className="m-3">
                            <NavItem>
                                <NavLink
                                    className={classnames({ active: activeTab === 1 })}
                                    onClick={() => {
                                        this.toggle(1);
                                    }}
                                >
                                    Departures
                                </NavLink>
                            </NavItem>
                            <NavItem>
                                <NavLink
                                    className={classnames({ active: activeTab === 2 })}
                                    onClick={() => {
                                        this.toggle(2);
                                    }}
                                >
                                    Arrivals
                                </NavLink>
                            </NavItem>
                        </Nav>
                        <TabContent activeTab={activeTab}>
                            <TabPane tabId={1}>
                                <Row>
                                    <Col sm="12">
                                        <FlightsComponent data={flights} fields={fields} activeTab={1}/>
                                    </Col>
                                </Row>
                            </TabPane>
                            <TabPane tabId={2}>
                                <Row>
                                    <Col sm="12">
                                        <FlightsComponent data={flights} fields={fields} activeTab={2}/>
                                    </Col>
                                </Row>
                            </TabPane>
                        </TabContent>
                    </div>
                </div>
            </div>
        );
    }
}

const mapDispatchToProps = dispatch => {
    return {
        loadFlights: p1 => dispatch(loadFlights(p1))
    };
};
const mapStateToProps = state => {
    return {
        flights: state.flightReducer.flights,
        isLoading: state.flightReducer.isLoading,
        lastUpdatedDate: state.flightReducer.lastUpdatedDate,

    };
};
export default connect(
    mapStateToProps,
    mapDispatchToProps
)(FlightsContainer);
