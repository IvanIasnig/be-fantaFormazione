// eslint.config.js
import js from "@eslint/js";
import tseslint from "typescript-eslint";
import prettier from "eslint-config-prettier";
import prettierPlugin from "eslint-plugin-prettier";
import globals from "globals";

/** @type {import("eslint").Linter.FlatConfig[]} */
export default [
  js.configs.recommended,
  ...tseslint.configs.recommended,
  prettier,
  {
    plugins: {
      prettier: prettierPlugin,
    },
    rules: {
      // Fa sì che Prettier mostri errori come ESLint warnings o errors
      "prettier/prettier": "warn",

      // Le tue regole ESLint personalizzate
      "@typescript-eslint/no-explicit-any": "error",
      "@typescript-eslint/no-unused-vars": ["warn", { argsIgnorePattern: "^_" }],
      "no-console": "off",
    },
    languageOptions: {
      parser: tseslint.parser,
      globals: {
        ...globals.node,
      },
    },
  },
];
