const fields = {
    time: { name: 'time', displayName: "Time", inputFilterable: true, sortable: true },
    expected: { name: 'expected', displayName: "Expected", inputFilterable: false, sortable: true },
    airline: { name: 'airline', displayName: "Airline", inputFilterable: true, sortable: true },
    flightNo:{ name: 'flight_no', displayName: "Flight No.", inputFilterable: true, sortable: true },
    destination: { name: 'destination', displayName: "Destination", inputFilterable: true },
    arrivingFrom: { name: 'arriving_from', displayName: "Arriving From", inputFilterable: true },
    gate: { name: 'gate', displayName: "Gate", inputFilterable: true },
    terminal: { name: 'terminal', displayName: "Terminal", inputFilterable: true },
    status: { name: 'status', displayName: "Status", inputFilterable: true}
};

export const DEPARTURES_FIELDS = [
    fields.time,
    fields.expected,
    fields.airline,
    fields.flightNo,
    fields.destination,
    fields.gate,
    fields.terminal,
    fields.status
];

export const ARRIVAL_FIELDS = [
    fields.time,
    fields.expected,
    fields.airline,
    fields.flightNo,
    fields.arrivingFrom,
    fields.gate,
    fields.terminal,
    fields.status
];