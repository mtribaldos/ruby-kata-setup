require_relative '../src/itinerary'

describe 'Itinerary' do
  it 'has a begin and an end' do
    origin = { name: 'Valencia', completed: true }
    destiny = { name: 'Castellón', completed: true }

    itinerary = Itinerary.new(origin, destiny)

    expect(itinerary).to be_kind_of(Itinerary)
  end

  it 'once all stops are completed the itinerary is completed' do
    origin = { name: 'Valencia', completed: true }
    destiny = { name: 'Castellón', completed: true }
    itinerary = Itinerary.new(origin, destiny)

    result = itinerary.completed?

    expect(result).to eq(true)
  end

  it 'is not completed when any stop is not completed' do
    origin = { name: 'Valencia', completed: false }
    destiny = { name: 'Castellón', completed: true }
    itinerary = Itinerary.new(origin, destiny)

    result = itinerary.completed?

    expect(result).to eq(false)
  end

  it 'may have intermediate stops' do
    origin = { name: 'Valencia', completed: true }
    destiny = { name: 'Castellón', completed: true }
    stop = { name: 'Nazaret', completed: true }
    itinerary = Itinerary.new(origin, destiny)

    itinerary.add_stop(stop)
    result = itinerary.completed?

    expect(result).to eq(true)
  end

  it 'is not completed when any stop is not completed' do
    origin = { name: 'Valencia', completed: true }
    destiny = { name: 'Castellón', completed: true }
    stop = { name: 'Nazaret', completed: false }
    itinerary = Itinerary.new(origin, destiny)

    itinerary.add_stop(stop)
    result = itinerary.completed?

    expect(result).to eq(false)
  end
end
