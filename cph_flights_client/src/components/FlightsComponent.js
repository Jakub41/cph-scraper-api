import React from 'react';
import FilterableTable from 'react-filterable-table';

const FlightComponent = (props) => {
    const renderTime = (props) => {
        if (!props.value) {
            return null;
        }
        const date = new Date(props.value);
        const formatTime = ('0' + date.getUTCHours()).slice(-2) + ":" + ('0' + date.getUTCHours()).slice(-2);

        return (
            <span>{formatTime}</span>
        );
    };

    const fields = [
        { name: 'time', displayName: "Time", inputFilterable: true, sortable: true, render: renderTime },
        { name: 'airline', displayName: "Airline", inputFilterable: true, sortable: true },
        { name: 'destination', displayName: "Destination", inputFilterable: true},
        { name: 'status', displayName: "Status", inputFilterable: true}
    ];
    return (
        <FilterableTable
            namespace="Flights"
            data={props.flights}
            pagersVisible={false}
            fields={fields}
            noRecordsMessage="There are no flights to display"
            noFilteredRecordsMessage="No flights match your filters!"
        />
    )
};

export default FlightComponent;