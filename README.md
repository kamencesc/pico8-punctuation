# PICO-8 Text Punctuation

This function allows adding punctuation marks to texts in PICO-8 using the "puny font" (activated with `CTRL+P`). With a simple substitution system, you can add acute and grave accents, diaeresis, circumflex, anunasika, the Spanish ñ, and the cedilla ç.

## Usage

The function processes a text where vowels in "puny font" format are modified according to the characters that follow them:

- **Standalone vowel** → Acute accent (example: a → `á`)
- **Vowel followed by \`** → Grave accent (example: a\` → `à`)
- **Vowel followed by #** → Diaeresis (example: u# → `ü`)
- **Vowel followed by ^** → Circumflex (example: e^ → `ê`)
- **Vowel followed by *** → Anunasika (example: a* → `å`)
- **c** → ç (cedilla)
- **n** → ñ (Spanish ñ)

## Token Optimization

The main function takes **153 tokens**, making it small and versatile. If you want to reduce token consumption, you can **comment out parts of the `IF` loop** to remove unnecessary punctuation marks based on the language you are using.

In spanish you don't need open grave accent, circumflex, anunasika and ç so you can reduce to arround 89 tokens.

## Special Character Substitution

If your text uses special characters (` * # ^`), you can replace them with other characters in the text to avoid conflicts with the punctuation system.

This function makes it easy to add punctuation marks to PICO-8 texts without modifying fonts or using more complex systems.
