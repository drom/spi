{signal: [
  ['cmd',
    {name: 'd', wave: 'x3x', data: 'C' },
    {name: 'q', wave: '010' },
    {name: 'a', wave: '1..' }
  ],
  ['req',
    {name: 'd',  wave: '3.x', data: 'i0', phase: -9 },
    {name: 'q',  wave: '1.0',             phase: -9 },
    {name: 'a',  wave: '01.',             phase: -9 }
  ],
  ['res',
    {name: 'd',  wave: 'x.3..x....3.', data: 'o0 o1', phase: -26 },
    {name: 'q',  wave: '0.1..0....1.',                phase: -26 },
    {name: 'a',  wave: '0...1.....01',                phase: -26 }
  ],
  {name: 'SS#',   wave: '=.0.................................'},
  {name: 'SCK',   wave: '=..n................................'},
  {name: 'IO0',   wave: 'x..4444444455555555x................', data: '7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0'},
  {name: 'IO1',   wave: 'z..................5555555555555555x', data: '7 6 5 4 3 2 1 0 7 6 5 4 3 2 1 0'},
  {name: 'phase', wave: '=..=.......=.......=.......=.......=..', data: ' Instruction i0 o0 o1'}
],
 config: {skin: 'narrow'}, head: {tock: -1}
}
