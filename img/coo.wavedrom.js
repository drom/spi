{signal: [
  ['cmd',
    {name: 'd',  wave: 'x3x', data: 'C' },
    {name: 'q',  wave: '010' },
    {name: 'a',  wave: '1..' }
  ],
  ['res',
    {name: 'd',  wave: 'x.3..x....3.', data: 'D0 D1', phase: -18 },
    {name: 'q',  wave: '0.1..0....1.',             phase: -18 },
    {name: 'a',  wave: '0...1.....01',             phase: -18 }
  ],
  {name: 'SS#',   wave: '=.0.........................'},
  {name: 'SCK',   wave: '=..n........................'},
  {name: 'IO0',   wave: 'x..44444444x................', data: '7 6 5 4 3 2 1 0'},
  {name: 'IO1',   wave: 'z..........5555555555555555x', data: '7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0'},
  {name: 'phase', wave: '=..=.......=.......=.......=..', data: ' Instruction D0 D1'}
],
 config: {skin: 'narrow'}, head: {tock: -1}
}
