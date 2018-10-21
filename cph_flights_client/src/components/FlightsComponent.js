import React from 'react';
import FilterableTable from 'react-filterable-table';

const FlightComponent = (props) => {
    return (
        props.data.length && <FilterableTable
            namespace="Flights"
            data={props.data}
            pagersVisible={false}
            fields={props.fields}
            noRecordsMessage="There are no flights to display"
            noFilteredRecordsMessage="No flights match your filters!"
        />
    )
};

export default FlightComponent;