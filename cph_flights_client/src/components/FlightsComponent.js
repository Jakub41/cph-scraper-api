import React from 'react';
// import FilterableTable from 'react-filterable-table';
import ReactTable from 'react-table';
import 'react-table/react-table.css';
import classNames from 'classnames';

import './flight.css';
// const FlightComponent = (props) => {
//     return (
//         props.data.length && <FilterableTable
//             namespace="Flights"
//             data={props.data}
//             pagersVisible={false}
//             fields={props.fields}
//             noRecordsMessage="There are no flights to display"
//             noFilteredRecordsMessage="No flights match your filters!"
//         />
//     )
// };

class FlightComponent extends React.Component {
    render() {
        const { data, activeTab } = this.props;
        let columns = [
           // { Header: 'Date', accessor: 'date' },
            { Header: 'Time', accessor: 'time' },
            { Header: 'Expected', accessor: 'expected' },
            { Header: 'Airline', accessor: 'airline', Cell: (row) => (<div className="airline-name">{row.value}</div>) },
            { Header: 'Flight No.', accessor: 'flight_no'},
        ];
        if (activeTab == 1) {
            columns.push({ Header: 'Destination', accessor: 'destination' })
        } else {
            columns.push({ Header: 'Arriving From', accessor: 'arriving_from' })
        }
        columns = columns.concat([
            { Header: 'Gate', accessor: 'gate' },
            { Header: 'Terminal', accessor: 'terminal' },
            { Header: 'Status', accessor: 'status', Cell: (row) => {
                    let class1 = classNames({
                        'to_gate': row.value == 'To gate',
                        'boarding': row.value == 'Boarding',
                        'closing': row.value == 'Closing',
                        'closed': row.value == 'Closed',
                    });
                    return (<div className={class1}>{row.value}</div>);
                }
            },
        ]);

        return (
            <div>
                <ReactTable
                    columns={ columns }
                    data = {this.props.data}
                />
            </div>
        )
    }
}

export default FlightComponent;