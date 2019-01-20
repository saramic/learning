module.exports = {
  extends: ["eslint:recommended"],
  parser: "babel-eslint",
  parserOptions: {
    ecmaVersion: 6,
    sourceType: "module",
    ecmaFeatures: {
      jsx: true
    }
  },
  env: {
    node: true
  },
  rules: {
    // quotes: ["error", "single", { avoidEscape: true }],
    // "comma-dangle": ["error", "always-multiline"]
  }
};
