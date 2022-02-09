const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
    theme: {
        extend: {
            fontFamily: {
                sans: ["Inter var", ...defaultTheme.fontFamily.sans],
            },
        },
    },
    content: [
        "./app/**/*.php",
        "./resources/**/*.html",
        "./resources/**/*.js",
        "./resources/**/*.jsx",
        "./resources/**/*.ts",
        "./resources/**/*.tsx",
        "./resources/**/*.php",
        "./resources/**/*.vue",
        "./resources/**/*.twig",
    ],
    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/typography"),
    ],
};
