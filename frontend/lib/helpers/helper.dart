String capitalize(String str) {
  if (str.length == 1) return str.toUpperCase();
  return str[0].toUpperCase() + str.substring(1, str.length);
}
