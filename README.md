# cryptoTools
Tools I sometimes use while solving cons from _The Cryptogram_ (and other sources)

## Files
- cryptoTools.nb - Mathematica notebook containing copies of the various functions developed along with notes about their use.
- *Work.nb - Mathematica notebooks containing scratch work, notes, and various iterations of cryptoTools functions. Maintained primarily for my own reference later when developing other functions.

## Roadmap
I pretty much am winging this, I'll add tools as I see uses for them in the future but for now here's a couple things I have in mind:

- [ ] Index of Conicidence
- [ ] Vigenere Cipher
-  Write some (or all) of the functions in Python
- Implementation of Encryption/Decryption functions for various ACA Cipher Types.

## Coding Standards
- Functions should be named using the Mathematica standard where the first letter is lowercase so as not to conflict with existing functions.
- Functions and variables should be named descriptivly to make code easier to read in the future.
- Encryption/Decryption functions will end with E and D respectively (for example ```caesarShiftE```, and ```caesarShiftD```) and should take (essentially) the same arguments in the same order.
- Coding should follow the DRY principle as much as possible.

## References & Resources
- [American Cryptogram Association](http://www.cryptogram.org/)

## Copyright & License
 The MIT License (MIT)
Copyright (c) 2013 David Williamson <http://davidized.com/>
 
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

