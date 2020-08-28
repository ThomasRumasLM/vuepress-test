const jsonStringToObj = JSONString => {
  const isAlphaCharacter = char => (char >= 'a' && char <= 'z') || (char >= 'A' && char <= 'Z');

  const stringInArray = JSONString.split('');
  const convertedArray = stringInArray.map((letter, index, array) => {
    if (letter === '\'') {
      if (isAlphaCharacter(array[index - 1]) && isAlphaCharacter(array[index + 1])) {
        return '\'';
      } else return '"';
    } else return letter;
  });

  const convertedString = convertedArray.join('');

  return JSON.parse(convertedString);
};

export { jsonStringToObj };