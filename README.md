# PICO-8 Text Punctuation

This function allows adding punctuation marks to texts in PICO-8 using the "puny font" (activated with `CTRL+P`). With a simple substitution system, you can add acute and grave accents, diaeresis, circumflex, anunasika, the Spanish ñ, and the cedilla ç.

![screenshot showing punctuation](https://github.com/kamencesc/pico8-punctuation/blob/main/punct_1.png?raw=true)

## Usage

The function processes a text where vowels in "puny font" format are modified according to the characters that follow them:

- **Standalone vowel** → Acute accent (example: a → `á`)
- **Vowel followed by \`** → Grave accent (example: a\` → `à`)
- **Vowel followed by #** → Diaeresis (example: u# → `ü`)
- **Vowel followed by ^** → Circumflex (example: e^ → `ê`)
- **Vowel followed by** \* → Anunasika (example: a* → `å`)
- **c** → ç (cedilla)
- **n** → ñ (Spanish ñ)
- **Question mark followed by \`** → ¿
- **Exclamation mark followed by \`** → ¡

## How does it work?

The changes are made using **control codes** that are reinterpreted when the text is rendered on screen. The vast majority simply shift a character to a specific position on top of the previous character.

Therefore, by placing '`' or '´' over a vowel from the **puny font** at the correct position, it is possible to achieve Latin accentuation without losing much vertical space while keeping the text compact.

The system for **'ñ'** works the same way. However, for **'ç'** it is reversed, since the *puny* **c** is placed over a dot.

Finally, the symbols **'¡'** and **'?'** are completely redrawn in **8×8** and repositioned so they fit within the **3×5** character structure, without harming the final text.

All **control codes** have been reinterpreted to take up as little space as possible.

You can find the full documentation about the control codes in the **P8SCII** section of the [Pico-8 API Cheatsheet](https://iiviigames.github.io/pico8-api/#p8scii) by iiviigames

## Token Optimization

The main function takes **172 tokens**, making it small and versatile. If you want to reduce token consumption, you can **comment out parts of the `IF` loop** to remove unnecessary punctuation marks based on the language you are using.

In spanish you don't need open grave accent, circumflex, anunasika and ç so you can reduce to arround 125 tokens and you have Acute accent, Dieresis, Spanish ñ and ¿ ¡ marks.

## Special Character Substitution

If your text uses special characters (` * # ^`), you can replace them with other characters in the text to avoid conflicts with the punctuation system.

This function makes it easy to add punctuation marks to PICO-8 texts without modifying fonts or using more complex systems.

## String Len

Here is a code snippet to calculate the length of a string that contains special characters for punctuation: 53 tokens and 202 characters.

    function plen(str)
     local r=#str
     for n=1,#str do
      for i in all(split("𝘢,𝘦,𝘪,𝘰,𝘶,𝘯,𝘤,?,!")) do
       for j in all(split("`,^,#,*")) do
        if(str[n+1]==j and str[n]==i)r-=1
       end
      end
     end
     return r
    end
