{signal: [
  ['cmd',
    {name: 'd',  wave: 'x3x', data: 'C' },
    {name: 'q',  wave: '010' },
    {name: 'a',  wave: '1..' }
  ],
  ['req',
    {name: 'd',  wave: '3.x', data: 'D0', phase: -8 },
    {name: 'q',  wave: '1.0',             phase: -8 },
    {name: 'a',  wave: '01.',             phase: -8 }
  ],
  {name: 'SS#',   wave: '=.0.................'},
  {name: 'SCK',   wave: '=..n................'},
  {name: 'IO0',   wave: 'x..4444444455555555x', data: '7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0'},
  {name: 'IO1',   wave: 'z...................'},
  {name: 'phase', wave: '=..=.......=.......=', data: ' instruction request'}
],
  head: {tock: -1}
}
