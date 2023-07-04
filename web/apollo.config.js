module.exports = {
  client: {
    output: "app/javascript",
    outputFlat: true,
    includes: ["./app/javascript/**/*.ts"],
    tagName: "gql",
    service: {
      name: "TuitionApiSchema",
      localSchemaFile: "./app/graphql/schema.graphql",
    },
  },
}