import { ApolloClient, ApolloProvider, InMemoryCache } from "@apollo/client";
import Box from "@mui/material/Box";
import "./App.css";
import AppBar from "./components/AppBar";
import SchoolList from "./components/SchoolList";

const client = new ApolloClient({
  uri: "http://127.0.0.1:3001/graphql",
  cache: new InMemoryCache(),
});

const App = () => {
  return (
    <ApolloProvider client={client}>
        <Box sx={{ flexGrow: 1 }}>
          <AppBar />
          <SchoolList />
        </Box>
    </ApolloProvider>
  )
};

export default App;
